class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    @participants.values.sum / @participants.count
  end

  def owed
    split_value = self.split
    @participants.each do |k, v|
      @participants[k] = split_value - v
    end
  end
end
