require('sinatra')
require('sinatra/reloader')
require('./lib/train')
require('./lib/city')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "train_route"})

get('/') do
  redirect to ('/trains')
end

get('/trains') do
  @trains = Train.all
  erb(:trains)
end

get('/trains/new') do
  erb(:new_train)
end

post ('/trains') do
  name = params[:train_name]
  train = Train.new({:name => name, :id => nil})
  train.save()
  redirect to('/trains')
end

get('/trains/:id') do
  @train = Train.find(params[:id].to_i())
  erb(:train)
end

get('/trains/:id/edit') do
  @train = Train.find(params[:id].to_i())
  erb(:edit_train)
end

patch('/trains/:id') do
  @train = Train.find(params[:id].to_i())
  @train.update(params[:name])
  redirect to('/trains')
end

delete('/trains/:id') do
  @train = Train.find(params[:id].to_i())
  @train.delete()
  redirect to('/trains')
end

get ('/trains/:id/cities/:city_id') do
  @city = City.find(params[:city_id].to_i())
  erb(:city)
end

post ('/trains/:id/cities') do
  @train = Train.find(params[:id].to_i())
  binding.pry
  city = City.new({:name => params[:city_name], :train_id => @train.id, :id => nil})
  binding.pry
  city.save()
  erb(:train)
end

# patch ('/trains/:id/cities/:cities_id') do
#   @train = Train.find(params[:id].to_i())
#   city = City.find(params[:id].to_i())
#   city.update(params[:name], @train_id)
#   erb(:train)
# end
#
# delete ('/trains/:id/cities/:cities_id') do
#   city = City.find(params[:id].to_i())
#   city.delete
#   @train = Train.find(params[:id].to_i())
#   erb(:train)
# end
