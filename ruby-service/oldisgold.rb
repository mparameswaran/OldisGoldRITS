require 'sinatra'
require 'sinatra/reloader' 
require 'json'
require './dbmanager'

set :port, 5678
#set :bind, '0.0.0.0'

get '/' do
	"Hello world #{Time.now}"
end


get '/oldisgold/:barcode' do
	content_type 'application/json'
	db_manager = DB_Manager.new()
    barcode = params['barcode']
	db_manager.get_inventory(barcode)
end

