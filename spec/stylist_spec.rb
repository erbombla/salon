require 'spec_helper'

describe 'Stylist' do
  describe '.all' do
    it ('initiates empty list') do
      expect(Stylist.all).to eq([])
    end
  end

  describe '.id' do
    it("displays the id") do
      new_stylist = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      new_stylist.save
      expect(new_stylist.id).to be_an_instance_of(Fixnum)
    end
  end

  describe '#==' do
    it("is the same stylist if it has the same attributes") do
      stylist1 = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      stylist2 = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      expect(stylist1).to eq(stylist1)
    end
  end

  describe '.find' do
    it('finds stylist by id') do
      stylist1 = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      stylist1.save
      stylist2 = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      stylist2.save
      expect(Stylist.find(stylist2.id)).to eq(stylist2)
    end
  end

  describe 'save' do
    it "saves a stylist to the database" do
      new_stylist = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      new_stylist.save
      expect(Stylist.all).to eq([new_stylist])
    end
  end

  describe 'delete' do
    it("deletes a stylist from the database") do
      stylist1 = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      stylist1.save
      stylist2 = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      stylist2.save
      stylist1.delete
      expect(Stylist.all).to eq([stylist2])
    end
  end

  describe 'update' do
    it('updates stylists in the database') do
      stylist = Stylist.new({id: nil, first_name: 'Harvey', last_name: 'Dent'})
      stylist.save
      stylist.update({last_name: 'Bertenilli'})
      expect(stylist.last_name).to eq('Bertenilli')
    end
  end
end
