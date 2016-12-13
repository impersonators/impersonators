require 'sinatra'

get '/' do
	"Hello"
	erb :home
end
