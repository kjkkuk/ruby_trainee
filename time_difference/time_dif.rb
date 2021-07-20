require 'time'

class TimeDif
  ############
end

p intervals = [%w[10:00 10:20], %w[10:40 11:00], %w[10:50 12:00], %w[12:00 13:00], %w[10:00 10:20]]
transform = TimeIntervals.new(intervals)
p transform.start
puts