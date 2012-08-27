require 'test/unit'


class Day
  def self.nice?(status)
    not [:rainy, :snowy, :cloudy, :stormy].include?(status)
  end
  
  attr_reader :statuses
  
  def initialize(statuses)
    @statuses = statuses
  end 
  
  def is?(status)
    statuses.include?(status)
  end
  
  def nice?
    statuses.all?{|status| self.class.nice?(status)}
  end
end

class DayTest < Test::Unit::TestCase
  def test_creation
    day = Day.new ([:windy, :sunny, :warm])
    assert day, 'creating instance of day'
  end
  
  def test_a_day_which_was_passed_rain_should_be_rainy
    day = Day.new([:rainy])
    assert day.is?(:rainy), 'should be rainy'
  end
  
  def test_a_day_which_was_passed_sun_should_not_be_cloudy
    day = Day.new([:sunny])
    assert !day.is?(:cloudy), 'should not be cloudy'
  end
  
  def test_a_day_which_was_passed_sun_should_be_a_niceday
    day = Day.new([:sunny])
    assert day.nice?, 'should be a niceday'
  end
  
  def test_a_day_which_was_passed_storm_should_not_be_a_niceday
    day = Day.new([:stormy])
    assert !day.nice?, 'should not be a niceday'
  end
end