require 'rails_helper'

RSpec.describe Admin::ActivitiesController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      @admin = create(:user, is_admin: true)
      sign_in @admin      
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'sets @activities to all Activities' do
      create_list(:activity, 2)

      get :index

      expect(assigns(:activities).count).to eq(3)
      expect(assigns(:activities).pluck(:id)).to eq(Activity.all.pluck(:id))
    end
  end
end
