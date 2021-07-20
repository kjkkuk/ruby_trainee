# frozen_string_literal: true

class Pet
  attr_reader :food

  def initialize(food)
    @food = food
  end
end
