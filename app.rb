require 'sinatra'
require 'sendgrid-ruby'

Links = {
	"/" 				=> "Home",
	"/about" 		=> "About",
	"/contact" 	=> "Contact",
	"/gallery" 	=> "Gallery",
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

#naming params from contact page
#getting SendGrid set up for contact page

post '/contact' do
	@page_title = "Contact"
	@local_links = serve_correct_links
  	@name = params[:name].upcase
  	@email = params[:email]
  	@content = params[:message]
  	@subject = "Impersonators NYCDA Emails"

	from = SendGrid::Email.new(email: @email)
	subject = @subject
	#below is where you can put your own email to test it
	to = SendGrid::Email.new(email: 'tester@tester.com')
	content = SendGrid::Content.new(type: 'text/plain', value: @content)
	mail = SendGrid::Mail.new(from, subject, to, content)
	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)

	puts response.status_code
	puts response.body

	erb :contact
end
