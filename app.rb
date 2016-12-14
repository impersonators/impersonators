require 'sinatra'
require 'sendgrid-ruby'

Links = {
	"/" 				=> "Home",
	"/about" 		=> "About",
	"/contact" 	=> "Contact",
	"/gallery" 	=> "Gallery",
}

get '/' do
	erb :home
end

get '/contact' do
  erb :contact
end

#naming params from contact page
#getting SendGrid set up for contact page

post '/contact' do
  @name = params[:name].upcase
  @email = params[:email]
  @content = params[:message]
  @subject = "Impersonators NYCDA Emails"
 
	from = SendGrid::Email.new(email: @email)
	subject = @subject
	#below is where you can put your own email to test it
	to = SendGrid::Email.new(email: 'eitherbrynneordevin@test.com')
	content = SendGrid::Content.new(type: 'text/plain', value: @content)
	mail = SendGrid::Mail.new(from, subject, to, content)
	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)

	puts response.status_code
	puts response.body

	erb :contact
end


