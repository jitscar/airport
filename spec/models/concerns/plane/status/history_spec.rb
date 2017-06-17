require 'rails_helper'

RSpec.describe Concerns::Plane::Status::History, type: :model do
  let(:plane) { create :plane }
  subject { plane.status_history }

  describe '#status_history' do
    context 'when plane was created' do
      it 'returns message for in_the_room status' do
        expect(subject).to include('In the room since')
      end
    end

    context 'when plane was added to schedule' do
      before { plane.add_to_schedule! }

      it 'returns message for changing to scheduled status' do
        expect(subject).to include('from in_the_room to scheduled')
      end
    end

    context 'when plane started flying' do
      before do
        plane.add_to_schedule!
        plane.start_flying!
      end

      it 'returns message for changing to departed status' do
        expect(subject).to include('from scheduled to departed')
      end
    end
  end
end
