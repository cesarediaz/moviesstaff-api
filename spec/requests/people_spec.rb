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
      expect(json_response.first.keys).to match_array(%w[aliases first_name id last_name list_of_movies])
    end
  end

  describe 'when :show' do
    let!(:person) {FactoryBot.create(:person) }

    before { get "/api/v1/people/#{person.id}", headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'return person' do
      json_response = JSON.parse(response.body)
      expect(json_response['id']).to eq(person.id)
      expect(json_response['first_name']).to eq(person.first_name)
      expect(json_response['last_name']).to eq(person.last_name)
      expect(json_response['aliases']).to eq(person.aliases)
    end

    it 'return key list_of_movies' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys.include?('list_of_movies')).to eq true
    end
  end
end
