require 'rails_helper'

describe 'GET /api/v1/people' do
  describe 'when :index' do
    let!(:people) {FactoryBot.create_list(:person, 10) }

    before { get '/api/v1/people', headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns all people' do
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(10)
    end

    it 'should match keys' do
      json_response = JSON.parse(response.body)
      expect(json_response.first.keys).to match_array(%w[aliases first_name id last_name])
    end
  end

  describe 'when :show' do
    let!(:person) {FactoryBot.create(:person) }

    before { get "/api/v1/people/#{person.id}", headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'return movie' do
      json_response = JSON.parse(response.body)
      expect(json_response['person']['id']).to eq(1)
      expect(json_response['person']['first_name']).to eq(person.first_name)
      expect(json_response['person']['last_name']).to eq(person.last_name)
      expect(json_response['person']['aliases']).to eq(person.aliases)
    end
  end
end
