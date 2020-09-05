class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    total = 0
    @activities.each do |activity|
      total += activity.participants.values.sum
    end
    total
  end

  def breakout
    results = @activities.map do |activity|
      activity.owed
    end
    breakout_result = {}
    results.each do |result|
      breakout_result.merge!(result){ |k, o, n| o + n }
    end
    breakout_result
  end

  def summary
    breakout.map {|k,v| "#{k}: #{v}"}.join("\n")
  end
end
