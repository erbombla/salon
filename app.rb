require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/stylist'
require './lib/client'
require 'pg'

DB = PG.connect({dbname: "hair_salon"})

get '/' do
  erb :index
end

get '/stylist/new' do
  erb :stylist_form
end

post '/stylist' do
  stylist_first_name = params.fetch('stylist_first_name')
  stylist_last_name = params.fetch('stylist_last_name')
  new_stylist = Stylist.new({stylist_first_name: stylist_first_name, stylist_last_name: stylist_last_name})
  erb :stylist_success
end

get '/client/new' do
  @stylists = Stylist.all
  erb :client_form
end

post '/new_client' do
  client_first_name = params.fetch('client_first_name')
  client_last_name = params.fetch('client_last_name')
  stylist_id = params.fetch('stylist')
  new_client = Client.new({client_first_name: client_first_name, client_last_name: client_last_name, stylist_id: stylist_id})
end

# get '/stylists' do
#   @stylists = Stylist.all
#   erb :stylist_list
# end
#
# get '/stylist/:id' do
#   @stylist = Stylist.find(params[:id]).to_i
#   erb :stylist_info
# end

post '/new_stylist' do
end
