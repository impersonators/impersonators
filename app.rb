require 'sinatra'
require 'sendgrid-ruby'

Links = {
	"/" 				=> "Home",
	"/about" 		=> "About",
	"/contact" 	=> "Contact",
	"/gallery" 	=> "Gallery",
}

Impersonators = {
	"Bob Jones" => "../images/impersonators/bob_jones.jpg",
	"Brad Tupree" => "../images/impersonators/brad_tupree.jpg",
	"Bubby Graham" => "../images/impersonators/bubby_graham.jpg",
	"Frank Ellis" => "../images/impersonators/frank_ellis.jpg",
	"Nick DiTone" => "../images/impersonators/nick_ditone.jpg",
	"Rick Jacobs" => "../images/impersonators/rick_jacobs.jpg",
}

def serve_correct_links
	links = {}
	Links.each do |k, v|
		if v != @page_title
			links[k] = v
		end
	end
	links
end

get '/' do
	@page_title = "Home"
	@local_links = serve_correct_links
	erb :home
end

get '/contact' do
	@page_title = "Contact"
	@local_links = serve_correct_links
  erb :contact
end

get '/about' do
	@page_title = "About"
	@local_links = serve_correct_links
  erb :about
end

get '/gallery' do
	@page_title = "Gallery"
	@local_links = serve_correct_links
  erb :gallery
end


#emailSent and enterEmail have page_title "Contact" to keep local_links correct
get '/emailSent' do
	@page_title = "Contact"
	@local_links = serve_correct_links
	erb :emailSent
end

get '/enterEmail' do
	@page_title = "Contact"
	@local_links = serve_correct_links
	erb :enterEmail
end


#naming params from contact page
#getting SendGrid set up for contact page

post '/contact' do	
	@page_title = "Contact"
	@local_links = serve_correct_links
	@name = params[:name].upcase
	@email = params[:email]
	@content = params[:message]
	@subject = "Impersonators NYCDA Emails"

	#checking for email to contain @
	special = '@'
	puts special
	regex = /[#{special}]/
	if @email =~ regex
	#send email and show emailSent page if @
		from = SendGrid::Email.new(email: @email)
		subject = @subject
		#below is where you can put your own email to test it
		to = SendGrid::Email.new(email: 'test@test.com')
		content = SendGrid::Content.new(type: 'text/plain', value: @content)
		mail = SendGrid::Mail.new(from, subject, to, content)
		sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
		response = sg.client.mail._('send').post(request_body: mail.to_json)

		erb :emailSent

	#don't send email and change to enterEmail if no @
	else
		puts @email
		erb :enterEmail
	end
end

