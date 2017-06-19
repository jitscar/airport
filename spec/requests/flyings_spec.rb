require 'rails_helper'

RSpec.describe 'Flyings', type: :request do
  describe 'POST /flyings' do
    before { create_list(:plane, 2) }

    context 'with correct params' do
      it 'returns ok status' do
        post '/flyings', plane_ids: Plane.in_the_room.ids
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with incorrect params' do
      it 'returns unprocessable_entity status' do
        post '/flyings', plane_ids: []
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
