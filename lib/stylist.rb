class Stylist
  attr_reader(:id, :name, :specialty)

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @specialty = attributes[:specialty]
  end

  def ==(another_doctor)
    self.name == another_doctor.name && self.id == another_doctor.id
  end

  def save
    result = DB.exec("INSERT INTO doctor_list (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.all
    returned_doctor = DB.exec('SELECT * FROM doctor_list;')
    doctors = []
    returned_doctor.each do |doctor|
      id = doctor.fetch('id').to_i
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      doctors.push(Doctor.new({id: id, name: name, specialty: specialty}))
    end
    doctors
  end

end
