require 'rspec'
require 'pg'
require 'album'
require 'song'
require 'pry'

DB = PG.connect({dbname => 'train_route'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM songs *;")
  end
end
