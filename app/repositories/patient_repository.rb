require "csv"

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @room_repository = room_repository
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # p attributes[:cured] # #<CSV::Row name:"Annie" cured:"false">
      # when you get data from the cssv file, make sure you turn it into real data (integers, booleans, instance)
      #                     "false" == "true"  -> false
      #                     "true" == "true"  -> true
      # p attributes
      attributes[:id] = attributes[:id].to_i
      attributes[:cured] = attributes[:cured] == "true"
      # room_id
      attributes[:room_id] = attributes[:room_id].to_i
      # our room repository has all the instances of a room
      # we need to find the one we need using the ID from the csv file
      # use the @room_repository.find(attributes[:room_id]) to get the room instance
      # p attributes
      # populates the @patients array with instances from the csv file
      patient = Patient.new(attributes)
      @patients << patient
    end
    @next_id = @patients.empty? ? @next_id : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "name", "cured"]
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end
end
