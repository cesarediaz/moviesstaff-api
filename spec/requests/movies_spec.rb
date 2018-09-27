require 'rails_helper'

describe 'GET /api/v1/movies' do
  describe 'when :index' do
    let!(:movies) {FactoryBot.create_list(:movie, 10) }

    before { get '/api/v1/movies', headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns all movies' do
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(10)
    end

    it 'should match keys' do
      json_response = JSON.parse(response.body)
      expect(json_response.first.keys).to match_array(%w[id title release_year])
    end
  end
end
