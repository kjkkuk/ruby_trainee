# frozen_string_literal: true

require './human'

human = Human.new(Job.new(1000), Pet.new('meat'))

p human.work
p human.feed
