# frozen_string_literal: true

require_relative './pet'
require_relative './job'

class Human
  attr_reader :job, :pet

  def initialize(job, pet)
    @job = job
    @pet = pet
  end

  def work
    "You worked and received a salary: #{job.salary}"
  end

  def feed
    "You feed your pet #{pet.food}"
  end
end
