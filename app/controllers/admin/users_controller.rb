require 'admin/admin_controller.rb'

class Admin::UsersController < AdminController
  def index
    @users = User.order(:created_at).page(params[:page])
  end

  def show
    @user       = User.friendly.find(params[:id])
    @activities = @user.activities.order(:created_at).page(params[:page])
  end
end
