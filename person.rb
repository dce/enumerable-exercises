class Person
  def initialize(name:, nationality:)
    @name = name
    @nationality = nationality
  end 

  def name
    @name
  end

  def nationality
    @nationality
  end

  def ==(other)
    @name == other.name && @nationality == other.nationality
  end
end
