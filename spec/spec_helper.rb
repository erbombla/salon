require 'rspec'
require 'pg'
require 'dr'
require 'patient'

DB = PG.connect({:dbname => "dr_office_test"})

RSpec.configure do |config|
  config.after :each do
    DB.exec("DELETE FROM doctor_list *;")
    DB.exec("DELETE FROM patient_list *;")
  end
end
