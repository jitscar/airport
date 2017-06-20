require 'rails_helper'

RSpec.describe Concerns::Plane::Status::History, type: :model do
  # Константы для проверки содержимого истории изменения статуса
  INIT_STATUS = I18n.t('plane.status_history.content.init',
                       status: I18n.t('plane.status.in_the_room'),
                       date: '')
  STATUS_TO_SCHEDULED = I18n.t('plane.status_history.content.update',
                               from: I18n.t('plane.status.in_the_room'),
                               to: I18n.t('plane.status.scheduled'), time: '')
  STATUS_TO_DEPARTED = I18n.t('plane.status_history.content.update',
                              from: I18n.t('plane.status.scheduled'),
                              to: I18n.t('plane.status.departed'), time: '')

  let(:plane) { create :plane }
  subject { plane.status_history }

  describe '#status_history' do
    context 'when plane was created' do
      it 'returns message for in_the_room status' do
        expect(subject).to include(INIT_STATUS)
      end
    end

    context 'when plane was added to schedule' do
      before { plane.add_to_schedule! }

      it 'returns message for changing to scheduled status' do
        expect(subject).to include(STATUS_TO_SCHEDULED)
      end
    end

    context 'when plane was added to departed' do
      before do
        plane.add_to_schedule!
        plane.add_to_departed!
      end

      it 'returns message for changing to departed status' do
        expect(subject).to include(STATUS_TO_DEPARTED)
      end
    end
  end
end
