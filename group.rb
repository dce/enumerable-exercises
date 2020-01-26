class Group
  def initialize(people)
    @people = people
  end

  def names
    @people.map { |dude| dude.name }
  end
end
