require 'rails_helper'
RSpec.describe FlyingWorker, type: :worker do
  let(:plane) { create(:plane) }

  describe '#perform' do
    before { plane.add_to_schedule! }

    it { expect { described_class.perform_async(plane.id) }.to change(described_class.jobs, :size).by(1) }
  end
end
