require 'rails_helper'

RSpec.describe "Api::V1::Teas", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe 'get teas' do
    it 'can return a list of all teas' do 
      Tea.create(title: 'Tea1', description: 'Tea1 description', temperature: 'Tea1 temperature', brew_time: 'Tea1 brew time')
      Tea.create(title: 'Tea2', description: 'Tea2 description', temperature: 'Tea2 temperature', brew_time: 'Tea2 brew time')
      Tea.create(title: 'Tea3', description: 'Tea3 description', temperature: 'Tea3 temperature', brew_time: 'Tea3 brew time')
      
      get '/api/v1/teas'
      
      expect(response).to be_successful

      teas = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(teas).to be_an(Array)
      expect(teas.length).to eq(3)
      expect(teas.first.keys).to eq([:id, :type, :attributes])
      expect(teas.first[:attributes].keys).to eq([:title, :description, :temperature, :brew_time])

      teas.each do |tea|
        expect(tea[:id]).to be_a(String)
        expect(tea[:type]).to eq('tea')
        expect(tea[:attributes][:title]).to be_a(String)
        expect(tea[:attributes][:description]).to be_a(String)
        expect(tea[:attributes][:temperature]).to be_a(String)
        expect(tea[:attributes][:brew_time]).to be_a(String)
      end

      expect(teas.first[:attributes][:title]).to eq(Tea.first.title)
      expect(teas.last[:attributes][:title]).to eq(Tea.last.title)
    end
  end
end
