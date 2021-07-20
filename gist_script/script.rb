# frozen_string_literal: true

class HistogramGenerator
  def initialize; end

  def self.process_string(string:)
    if !string.empty?

      string.gsub(/[ ,.\r\n]/, ' ').split(' ').each do |word|
        result[word] += 1
      end

    else
      {}
    end
  end

  def self.sort_histogram(histogram)
    sort = ->(_word, occurencies) do occurencies; end
    histogram.sort_by { |word, occurencies| sort.call(word, occurencies) }.to_h
  end
end

module App
  TEXT = 'When Mr. and Mrs. Dursley woke up on the dull, gray Tuesday our story
starts, there was nothing about the cloudy sky outside to suggest that
strange and mysterious things would soon be happening all over the
country. Mr. Dursley hummed as he picked out his most boring tie for
work, and Mrs. Dursley gossiped away happily as she wrestled a screaming
Dudley into his high chair.'
  def perform
    text = ''
    puts('reading file')
    puts("extracted string: #{text}")
    histogram = Histogram_Generator.processString({ string: Text })
    puts('generated histogram:')
    puts(histogram)
    puts('sorted histogram:')
    puts(Histogram_Generator.sort_histogram(histogram))
  end
  module_function :perform

  def number_to_word(number)
    numbers = %w[one two three four five six seven eight nine]
    (1..9).cover?(number) ? numbers[number - 1] : 'oops'
  end
  module_function :number_to_word
end

puts App.perform
[1, 2, 3, 4, 5, 6, 7, 8, 9, 13_666].each do |number|
  puts App.number_to_word(number)
end
