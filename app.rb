require('sinatra')
require('sinatra/reloader')
require('./lib/train')
require('./lib/city')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({dbname => "train_route"})

get('/') do
  # redirect to ('/trains')
  "This will be our homepage"
end

get('/trains') do
  # @trains = Train.all
  # erb(:trains)
  "This route will show a list of trains"
end

get('/trains/new') do
  "This will take us to a page with a form for adding trains"
end

get('/trains/:id') do
  "This route will show a specific train based on its ID. The value of ID here is #{params[:id]}."
end

post('/trains') do
  "This route will add a train to our list of trains."
end

get('/trains/:id/edit') do
  "This will take us to a page with a form for updating a train with an ID of #{params[:id]}."
  # @train = Train.find(params[:id].to_i())
  # erb(:edit_train)
end

patch('/trains/:id') do
  "This route will update a train."
end

delete('/trains/:id') do
  "This route will delete a train."
end
