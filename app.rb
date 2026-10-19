require_relative "app/models/patient"
require_relative "app/models/room"
require_relative "app/repositories/patient_repository"

# paul = Patient.new({name: "Paul"})
paul = Patient.new(name: "Paul", cured: false)
# p patient = Patient.new
# p paul
yoshi = Patient.new(name: "Yoshi")
# lucas = Patient.new(name: "Lucas")

# vip_room = Room.new(capacity: 2, [yoshi, paul])
# vip_room = Room.new(capacity: 2)
# vip_room.add_patient(paul)
# vip_room.add_patient(yoshi)

# p vip_room.full?
# vip_room.add_patient(lucas)

# p vip_room.patients # array of patients
# p paul.room
# p paul.room.patients

# User.new(username: "", email: "")m
# room_csv = "data/rooms.csv"
# room_repository = RoomRepository.new(rooms_csv)
patients_csv = "data/patients.csv"
patient_repository = PatientRepository.new(patients_csv, room_repository)

patient_repository.create(paul)
patient_repository.create(yoshi)
p patient_repository