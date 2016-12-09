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

  def save
    result = DB.exec("INSERT INTO stylists (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.all
    returned_stylist = DB.exec('SELECT * FROM stylists;')
    stylists = []
    returned_stylist.each do |stylist|
      id = stylist.fetch('id').to_i
      first_name = stylist.fetch('first_name')
      last_name = stylist.fetch('last_name')
      stylists.push(Stylist.new({id: id, first_name: first_name, last_name: last_name}))
    end
    stylists
  end

end
