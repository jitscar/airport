require 'rails_helper'

RSpec.describe FlyingService do
  let(:plane) { create(:plane) }
  subject { described_class.new([plane.id]) }

  describe '#run' do
    context 'when the plane is ready for flying' do
      it 'changes status to scheduled' do
        subject.run
        expect(plane.reload.status).to eq('scheduled')
      end
    end

    context 'when the plane was started flying' do
      it 'changes status to departed' do
        Sidekiq::Testing.inline! do
          subject.run
          expect(plane.reload.status).to eq('departed')
        end
      end
    end
  end
end
