# frozen_string_literal: true

class TimeDifference
  attr_reader :intervals, :minutes

  def initialize(intervals)
    @intervals = intervals
  end

  def start
    intervals_in_minutes
    minutes_in_ranges
    ranges_in_arrays
    collect_minutes
    free_minutes
    minutes_in_intervals
    transform_intervals
    @intervals
  end

  private

  def intervals_in_minutes
    @intervals.map do |interval|
      interval[0] = get_minutes(interval.first)
      interval[1] = get_minutes(interval.last)
    end
  end

  def get_minutes(time)
    hour = time.split(':').first.to_i
    minute = time.split(':').last.to_i
    hour * 60 + minute
  end

  def get_time(minutes)
    hour = minutes.to_i / 60
    minute = minutes.to_i % 60
    return "#{hour}:#{minute}" if hour > 9 && minute > 9
    return "#{hour}:0#{minute}" if hour > 9 && minute <= 9
    return "0#{hour}:#{minute}" if hour <= 9 && minute > 9

    "0#{hour}:0#{minute}" if hour <= 9 && minute <= 9
  end

  def minutes_in_ranges
    @intervals.map! do |interval|
      Range.new(interval[0], interval[1])
    end
  end

  def ranges_in_arrays
    @intervals.map!(&:to_a)
  end

  def collect_minutes
    @minutes = []
    @intervals.each do |interval|
      @minutes += interval
    end
    @minutes.uniq!
  end

  def free_minutes
    all_minutes = Range.new(0, 23 * 60 + 59).to_a
    @minutes = all_minutes - @minutes
  end

  def minutes_in_intervals
    prev = @minutes[0]
    @intervals = @minutes.slice_before do |e|
      prev2 = prev
      prev = e
      prev2 + 1 != e
    end.map { |b, *, c| c ? (b..c) : b }
  end

  def transform_intervals
    @intervals.map! do |interval|
      array = []
      array << get_time(interval.first)
      array << get_time(interval.last)
      array
    end
  end
end

p intervals = [%w[10:00 10:20], %w[10:40 11:00], %w[10:50 12:00], %w[12:00 13:00], %w[10:00 10:20]]
transform = TimeDifference.new(intervals)
p transform.start
puts

# p intervals = [%w[9:00 10:00], %w[11:00 12:00], %w[13:00 14:00]]
# transform = TimeDifference.new(intervals)
# p transform.start
# puts

# p intervals = [%w[9:00 17:00], %w[10:05 11:00], %w[10:50 12:00], %w[12:00 13:00], %w[11:30 12:20]]
# transform = TimeDifference.new(intervals)
# p transform.start
