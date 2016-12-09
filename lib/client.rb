class Client
  attr_reader(:id, :patient_name, :birthday, :doctor_id)

  def initialize(attributes)
    @id = attributes[:id]
    @patient_name = attributes[:patient_name]
    @birthday = attributes[:birthday]
    @doctor_id = attributes[:doctor_id]
  end

  def ==(another_patient)
    self.patient_name == another_patient.patient_name && self.id == another_patient.id && self.birthday == another_patient.birthday && self.doctor_id == another_patient.doctor_id
  end

  def save
    result2 = DB.exec("INSERT INTO patient_list (patient_name, birthday, dr_id) VALUES ('#{@patient_name}', '#{@birthday}', '#{@doctor_id}') RETURNING id;")
    @id = result2.first.fetch('id').to_i
  end

  def self.all
    returned_patient = DB.exec('SELECT * FROM patient_list;')
    patients = []
    returned_patient.each do |patient|
      id = patient.fetch('id').to_i
      patient_name = patient.fetch('patient_name')
      birthday = patient.fetch('birthday')
      doctor_id = patient.fetch('dr_id').to_i
      patients.push(Patient.new({id: id, patient_name: patient_name, birthday: birthday, doctor_id: doctor_id}))
    end
    patients
  end

end
