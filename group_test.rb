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

    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
    ])

    assert_equal ["Steve"], group.names
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

  def test_americans
    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "Pepe", nationality: :mx)
    ])

    assert_equal(
      [
        Person.new(name: "Steve", nationality: :us)
      ],
      group.americans
    )
  end

  def test_by_country
    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "John", nationality: :us),
      Person.new(name: "Pepe", nationality: :mx)
    ])

    assert_equal(
      {
        us: [
          Person.new(name: "Steve", nationality: :us),
          Person.new(name: "John", nationality: :us)
        ],
        mx: [
          Person.new(name: "Pepe", nationality: :mx)
        ]
      },
      group.by_country
    )
  end

  def test_americans_and_others
    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "John", nationality: :us),
      Person.new(name: "Pepe", nationality: :mx)
    ])

    americans, others = group.americans_and_others

    assert_equal(
      [
        Person.new(name: "Steve", nationality: :us),
        Person.new(name: "John", nationality: :us)
      ],
      americans
    )

    assert_equal(
      [
        Person.new(name: "Pepe", nationality: :mx),
      ],
      others
    )
  end

  def test_populations
    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "John", nationality: :us),
      Person.new(name: "Pepe", nationality: :mx)
    ])

    assert_equal(
      {
        us: 2,
        mx: 1
      },
      group.populations
    )
  end

  def test_nationalities
    group = Group.new([
      Person.new(name: "Steve", nationality: :us),
      Person.new(name: "John", nationality: :us),
      Person.new(name: "Pepe", nationality: :mx)
    ])

    assert_equal [:mx, :us], group.nationalities
  end
end
