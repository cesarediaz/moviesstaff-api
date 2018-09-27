require 'rails_helper'

describe 'GET /v1/movies' do
  let!(:movies) {FactoryBot.create_list(:movie, 10) }

  before { get '/v1/movies', headers: { 'Accept': 'application/vnd' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns all movies' do
    body = JSON.parse(response.body)
    expect(body['data'].size).to eq(10)
  end
end
