require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'GET #get' do
    it 'returns http success' do
      get :get

      expect(response).to have_http_status(:success)
    end

    it 'renders the get template' do
      get :get

      expect(response).to render_template('get')
    end
  end

  describe 'GET #readme' do
    it 'returns http success' do
      get :readme

      expect(response).to have_http_status(:success)
    end

    it 'renders the readme template' do
      get :readme

      expect(response).to render_template('readme')
    end
  end
end
