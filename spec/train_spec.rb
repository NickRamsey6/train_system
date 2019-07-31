require('spec_helper')

describe '#Train' do
  before(:each) do
    Train.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no trains") do
      expect(Train.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a train") do
      train = Train.new({:name => "Thomas", :id => nil})
      train.save()
      train2 = Train.new({:name => "Lionel", :id => nil})
      train2.save()
      expect(Train.all).to(eq([train, train2]))
    end
  end

  describe('.find') do
    it("finds a train by id") do
      train = Train.new({:name => "Thomas", :id => nil})
      train.save()
      train2 = Train.new({:name => "Lionel", :id => nil})
      train2.save()
      expect(Train.find(train.id)).to(eq(train))
    end
  end
end
