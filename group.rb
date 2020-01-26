class Group
  def initialize(people)
    @people = people
  end

  def names
    # https://stackoverflow.com/questions/14881125/what-does-to-proc-method-mean
    @people.map(&:name)
  end

  def all_americans?
    @people.all? { |p| p.nationality == :us }
  end

  def americans
    @people.select { |p| p.nationality == :us }
  end

  def by_country
    @people.group_by(&:nationality)
  end

  def americans_and_others
    @people.partition { |p| p.nationality == :us }
  end
end



# Proc.new

# https://medium.com/@AdamKing0126/ruby-whats-the-deal-with-procs-and-lambdas-165450cdf573