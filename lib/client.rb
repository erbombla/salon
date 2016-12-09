class Client
  attr_reader(:id, :client_first_name, :client_last_name, :stylist_id )

  def initialize(attributes)
    @id = attributes[:id]
    @client_first_name = attributes[:client_first_name]
    @client_last_name = attributes[:client_last_name]
    @stylist_id = attributes[:stylist_id]
  end

  def ==(another_client)
    self.client_first_name == another_client.client_first_name && self.client_last_name == another_client.client_last_name && self.stylist_id == another_client.stylist_id
  end

  def self.all
    returned_clients = DB.exec('SELECT * FROM clients;')
    clients = []
    returned_clients.each do |client|
      id = client.fetch('id').to_i
      client_first_name = client.fetch('client_first_name')
      client_last_name = client.fetch('client_last_name')
      stylist_id = client.fetch('stylist_id').to_i
      clients.push(Client.new({id: id, client_first_name: client_first_name, client_last_name: client_last_name, stylist_id: stylist_id }))
    end
    clients
  end

  def save
    result = DB.exec("INSERT INTO clients (client_first_name, client_last_name, stylist_id) VALUES ('#{@client_first_name}', '#{@client_last_name}', '#{@stylist_id}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.find(id)
      found_client = nil
      Client.all.each { |client| client.id == id.to_i ? found_client = client : false}
      found_client
    end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  def update(attributes)
    @client_first_name = attributes.fetch(:client_first_name, @client_first_name)
    @client_last_name = attributes.fetch(:client_last_name, @client_last_name)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    @id = self.id
    DB.exec("UPDATE clients SET (client_first_name, client_last_name, stylist_id) = ('#{@client_first_name}', '#{@client_last_name}', '#{@stylist_id}') WHERE id = #{@id};")
  end
end
