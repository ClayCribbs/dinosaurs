require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      @admin_user = create(:user, is_admin: true)
      sign_in @admin_user      
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'sets @users to all Users' do
      create_list(:user, 2)

      get :index

      expect(assigns(:users).count).to eq(3)
      expect(assigns(:users).pluck(:id)).to eq(User.all.pluck(:id))
    end
  end

  describe 'GET #show' do
    before(:each) do
      @admin_user = create(:user, is_admin: true)
      @user       = create(:user)

      sign_in @admin_user

      get :show, params: { id: @user.to_param }
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'sets @user to the requested User' do
      expect(assigns(:user)).to eq(@user)
    end
  end
end
