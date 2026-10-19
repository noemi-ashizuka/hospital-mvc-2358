class Room
  attr_reader :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0 # integer
    @patients = attributes[:patients] || [] # array of patient instances
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    unless full?
      @patients << patient
      patient.room = self
    end
  end
end
