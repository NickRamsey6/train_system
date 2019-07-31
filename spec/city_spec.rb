require('spec_helper')
require('city')
require('train')

describe '#City' do
  before(:each) do
    Train.clear
    City.clear
    @train = Train.new({:name => "Thomas", :id => nil})
    @train.save()
  end

  describe('#==') do
    it("is the same city if it has the same attributes as another city") do
      city = City.new({:name => "Potland", :train_id => @train.id, :id => nil})
      city2 = City.new({:name => "Potland", :train_id => @train.id, :id => nil})
      expect(city).to(eq(city2))
    end
  end

  describe('.all') do
    it("returns a list of all cities") do
      city = City.new({:name => "Potland", :train_id => @train.id, :id => nil})
      city.save()
      city2 = City.new({:name => "Seattle", :train_id => @train.id, :id => nil})
      city2.save()
      expect(City.all).to(eq([city, city2]))
    end
  end

  describe('.clear') do
    it("clears all cities") do
      city = City.new({:name => "Boston", :train_id => @train.id, :id => nil})
      city.save()
      city2 = City.new({:name => "Nashville", :train_id => @train.id, :id => nil})
      city2.save()
      city.clear()
      expect(City.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a city") do
      city = City.new({:name => "Boston", :train_id => @train.id, :id => nil})
      city.save()
      expect(City.all).to(eq([city]))
    end
  end

  describe('.find') do
    it("finds a city by id") do
      city = City.new({:name => "Chicago", :train_id => @train.id, :id => nil})
      city.save()
      city2 = City.new({:name => "New York City", :train_id => @train.id, :id => nil})
      city2.save()
      expect(City.find(city.id)).to(eq(city))
    end
  end

  describe('#update') do
    it("updates an city by id") do
      city = City.new({:name => "Boston", :train_id => @train.id, :id => nil})
      city.save()
      city.update("Portland", @train.id)
      expect(city.name).to(eq("Portland"))
    end
  end

  describe('#delete') do
    it("deletes all cities belonging to a deleted train") do
      train = Train.new({:name => "Chicago", :id => nil})
      train.save()
      city = City.new({:name => "Boston", :train_id => train.id, :id => nil})
      city.save()
      train.delete()
      expect(City.find(city.id)).to(eq(nil))
    end
  end


  describe('.find_by_train') do
    it("finds cities for an train") do
      train2 = Train.new({:name => "Thomas", :id => nil})
      train2.save
      city = City.new({:name => "Lionel", :train_id => @train.id, :id => nil})
      city.save()
      city2 = City.new({:name => "California", :train_id => train2.id , :id => nil})
      city2.save()
      expect(City.find_by_city(train2.id)).to(eq([city2]))
    end
  end

  describe('#train') do
    it("finds the train a city belongs to") do
      city = City.new({:name => "Austin", :train_id => @train.id, :id => nil})
      city.save()
      expect(city.train()).to(eq(@train))
    end
  end
end
