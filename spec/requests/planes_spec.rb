require 'rails_helper'

RSpec.describe 'Planes', type: :request do
  describe 'GET /planes' do
    it 'returns ok status' do
      get planes_path
      expect(response).to have_http_status(:ok)
    end
  end
end
