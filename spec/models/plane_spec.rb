require 'rails_helper'

RSpec.describe Plane, type: :model do
  let(:plane) { build :plane }

  describe '#add_to_schedule!' do
    it { expect(plane).to transition_from(:in_the_room).to(:scheduled).on_event(:add_to_schedule) }
  end

  describe '#start_flying!' do
    it { expect(plane).to transition_from(:scheduled).to(:departed).on_event(:start_flying) }
  end
end
