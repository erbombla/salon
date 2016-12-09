require 'spec_helper'

describe 'Doctor' do

  describe '.id' do
    it("displays the id") do
      new_doctor = Doctor.new({id: nil, name: "Dr. Mike Hunt", specialty: 'OBGYN'})
      new_doctor.save
      expect(new_doctor.id).to be_an_instance_of(Fixnum)
    end
  end

  describe '.name' do
    it("displays the doctor name") do
      new_doctor = Doctor.new({id: nil, name: "Dr. Mike Hunt", specialty: 'OBGYN'})
      expect(new_doctor.name).to eq("Dr. Mike Hunt")
    end
  end

  describe '.specialty' do
    it("displays the doctor specialty") do
      new_doctor = Doctor.new({id: nil, name: "Dr. Mike Hunt", specialty: 'OBGYN'})
      expect(new_doctor.specialty).to eq("OBGYN")
    end
  end

  describe 'save' do
    it "saves a doctor's information to the database" do
      new_doctor = Doctor.new({id: nil, name: 'Dr. Mike Hunt', specialty: 'OBGYN'})
      new_doctor.save
      expect(Doctor.all).to eq([new_doctor])
    end
  end

  describe '.all' do
  it ('starts with no lists') do
    expect(Doctor.all).to eq([])
    end
  end
  describe '#==' do
    it("is the same doctor if it has the same name and specialty") do
      doctor1 = Doctor.new({id: nil, name: 'Dr. Mike Hunt', specialty: 'OBGYN'})
      doctor2 = Doctor.new({id: nil, name: 'Dr. Mike Hunt', specialty: 'OBGYN'})
      expect(doctor1).to eq(doctor2)
    end
  end
end
