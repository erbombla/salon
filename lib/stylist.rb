class Stylist
  attr_reader(:id, :first_name, :last_name)

  def initialize(attributes)
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
  end

  def ==(another_stylist)
    self.first_name == another_stylist.first_name && self.last_name == another_stylist.last_name
  end

  def client_list
      returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id};")
      clients = []
      returned_clients.each do |client|
        client_first_name = client.fetch('client_first_name')
        client_last_name = client.fetch('client_last_name')
        id = client.fetch('id').to_i
        stylist_id = client.fetch('stylist_id').to_i
        clients.push(Client.new({id: client['id'].to_i, client_first_name: client['client_first_name'], client_last_name: client['client_last_name'], stylist_id: client['stylist_id'].to_i}))
      end
      clients
    end

  def self.all
    returned_stylists = DB.exec('SELECT * FROM stylists;')
    stylists = []
    returned_stylists.each do |stylist|
      id = stylist.fetch('id').to_i
      first_name = stylist.fetch('first_name')
      last_name = stylist.fetch('last_name')
      stylists.push(Stylist.new({id: id, first_name: first_name, last_name: last_name}))
    end
    stylists
  end

  def save
    result = DB.exec("INSERT INTO stylists (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.find(id)
    found_stylist = nil
    Stylist.all.each { |stylist| stylist.id == id.to_i ? found_stylist = stylist : false}
    found_stylist
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  def update(attributes)
    @first_name = attributes.fetch(:first_name, @first_name)
    @last_name = attributes.fetch(:last_name, @last_name)
    @id = self.id
    DB.exec("UPDATE stylists SET (first_name, last_name) = ('#{@first_name}', '#{@last_name}') WHERE id = #{@id};")
  end
end
