# require 'spec_helper'
#
# describe 'Patient' do
#
#   describe '.id' do
#     it("displays the id") do
#       new_patient = Patient.new({id: nil, doctor_id: 1, patient_name: "Donald Trump", birthday: "1946-06-14 00:00:00"})
#       new_patient.save
#       expect(new_patient.id).to be_an_instance_of(Fixnum)
#     end
#   end
#
#   describe '.patient_name' do
#     it("displays the patient name") do
#       new_patient = Patient.new({id: nil, doctor_id: 1, patient_name: "Donald Trump", birthday: "1946-06-14 00:00:00"})
#       expect(new_patient.patient_name).to eq("Donald Trump")
#     end
#   end
#
#   describe '.birthday' do
#     it("displays the patient birthday") do
#       new_patient = Patient.new({id: nil, patient_name: "Donald Trump", birthday: "1946-06-14 00:00:00", doctor_id: 1})
#       expect(new_patient.birthday).to eq("1946-06-14 00:00:00")
#     end
#   end
#
#   describe 'save' do
#     it "saves a patients's information to the database" do
#       new_patient = Patient.new({id: nil, patient_name: 'Donald Trump', birthday: "1946-06-14 00:00:00", doctor_id: 1})
#       new_patient.save
#       expect(Patient.all).to eq([new_patient])
#     end
#   end
#
#   describe '.all' do
#   it ('starts with no lists') do
#     expect(Patient.all).to eq([])
#     end
#   end
#
#   describe '#==' do
#     it("is the same patient if it has the same name and birthday") do
#       patient1 = Patient.new({id: nil, patient_name: 'Donald Trump', birthday: "1946-06-14 00:00:00", doctor_id: 1})
#       patient2 = Patient.new({id: nil, patient_name: 'Donald Trump', birthday: "1946-06-14 00:00:00", doctor_id: 1})
#       expect(patient1).to eq(patient2)
#     end
#   end
# end
