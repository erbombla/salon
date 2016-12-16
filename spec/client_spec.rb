require 'spec_helper'

describe 'Client' do
  describe '.all' do
    it ("initiates empty list") do
      expect(Client.all).to eq([])
    end
  end

  describe '.id' do
    it("displays the client id") do
      client = Client.new({id: nil, client_first_name: "Eric", client_last_name: "Bomblatus", stylist_id: 1})
      client.save
      expect(client.id).to be_an_instance_of(Fixnum)
    end
  end

  describe '#==' do
    it("is the same client if it has the same attributes") do
      client1 = Client.new({id: nil, client_first_name: "Eric", client_last_name: "Bomblatus", stylist_id: 1})
      client2 = client = Client.new({id: nil, client_first_name: "Eric", client_last_name: "Bomblatus", stylist_id: 1})
      expect(client1).to eq(client2)
    end
  end

  describe '.find' do
    it("finds client by id") do
      client1 = Client.new({id: nil, client_first_name: "Eric", client_last_name: "Bomblatus", stylist_id: 1})
      client1.save
      client2 = Client.new({id: nil, client_first_name: "Stella", client_last_name: "Hennecke", stylist_id: 2})
      client2.save
      expect(Client.find(client2.id)).to eq(client2)
    end
  end

  describe 'save' do
    it ("saves a client to the database") do
      client = Client.new({id: nil, client_first_name: "Eric", client_last_name: "Bomblatus", stylist_id: 1})
      client.save
      expect(Client.all).to eq([client])
    end
  end

  describe 'delete' do
    it("deletes a client from the database") do
      client1 = Client.new({id: nil, client_first_name: "Eric", client_last_name: "Bomblatus", stylist_id: 1})
      client1.save
      client2 = Client.new({id: nil, client_first_name: "Stella", client_last_name: "Hennecke", stylist_id: 2})
      client2.save
      client1.delete
      expect(Client.all).to eq([client2])
    end
  end

  describe 'update' do
    it('updates client in the database') do
      client = Client.new({id: nil, client_first_name: "Eric", client_last_name: "Bomblatus", stylist_id: 1})
      client.save
      client.update({client_first_name: 'Lee'})
      expect(client.client_first_name).to eq('Lee')
    end
  end
end
