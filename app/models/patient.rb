class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room] # instance of a room
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end
end

# instance.cured? # -> true
