# frozen_string_literal: true

require 'rspec'
require_relative '../lib/human'

RSpec.describe Human do
  let(:job) { double('job') }
  let(:pet) { double('pet') }
  let(:human) { described_class.new(job, pet) }

  describe '#work' do
    it 'should work and get salary' do
      allow(job).to receive(:salary)

      expect(human.work).to eq("You worked and received a salary: #{job.salary}")
    end
  end

  describe '#feed' do
    it 'should feed pet' do
      expect(pet).to receive(:food) { 'meat' }

      expect(human.feed).to eq('You feed your pet meat')
    end
  end
end
