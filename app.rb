require 'sinatra'

Links = {
	"/" 				=> "Home",
	"/about" 		=> "About",
	"/contact" 	=> "Contact",
	"/gallery" 	=> "Gallery",
}

get '/' do
	"Hello"
	erb :home
end
