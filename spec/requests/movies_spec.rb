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
      expect(json_response.first.keys).to match_array(%w[casting directors id producers release_year title])
    end
  end

  describe 'when :show' do
    let!(:movie) {FactoryBot.create(:movie) }

    before { get "/api/v1/movies/#{movie.id}", headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'return movie' do
      json_response = JSON.parse(response.body)
      expect(json_response['id']).to eq(movie.id)
      expect(json_response['title']).to eq(movie.title)
      expect(json_response['release_year']).to eq(Movie.romanize(movie.release_year))
    end

    it 'return keys directors, producers, casting' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys.include?('directors')).to eq true
      expect(json_response.keys.include?('producers')).to eq true
      expect(json_response.keys.include?('casting')).to eq true
    end
  end
end
