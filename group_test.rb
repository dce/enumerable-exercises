require "minitest/autorun"

require "./group"
require "./person"

class GroupTest < Minitest::Test
  def test_names
    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "John", nationality: :us)
    ])

    assert_equal ["Steve", "John"], group.names
  end

  def test_all_americans
    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "John", nationality: :us)
    ])

    assert group.all_americans?

    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "Pepe", nationality: :mx)
    ])

    assert !group.all_americans?
  end
end
