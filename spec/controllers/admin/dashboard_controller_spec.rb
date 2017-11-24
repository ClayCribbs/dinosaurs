require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      @admin_user = create(:user, is_admin: true)
      sign_in @admin_user
    end

    it 'redirects Users who are not admin to the root url' do
      @admin_user.update(is_admin: false)
      @admin_user.reload

      get :index

      expected_redirect_path = root_path

      expect(response).to redirect_to(expected_redirect_path)
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end
end
