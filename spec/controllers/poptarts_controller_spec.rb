require 'rails_helper'

describe PoptartsController do
  context '#index' do
    it 'returns all the poptarts' do
      Poptart.create(flavor: 'strawberry', sprinkles: 'red')

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      poptarts = JSON.parse(response.body)
      expect(poptarts.count).to eq(1)

      poptart = poptarts.last
      expect(poptart['flavor']).to eq('strawberry')
      expect(poptart['sprinkles']).to eq('red')
    end

    it 'returns the requested poptart' do
      p = Poptart.create(flavor: 'blueberry muffin', sprinkles: 'blue')

      get :show, id: p.id, format: :json

      expect(response).to have_http_status(:ok)

      poptart = JSON.parse(response.body)
      expect(poptart['flavor']).to eq('blueberry muffin')
      expect(poptart['sprinkles']).to eq('blue')
    end

    it 'creates the best poptart' do
      post :create, format: :json,
                    poptart: { flavor: 'boston creme', sprinkles: 'black and white' }

      expect(response).to have_http_status(:created)

      poptart = JSON.parse(response.body)
      expect(poptart['flavor']).to eq('boston creme')
      expect(poptart['sprinkles']).to eq('black and white')
    end
  end
end
