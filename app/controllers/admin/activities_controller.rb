require 'admin/admin_controller.rb'

class Admin::ActivitiesController < AdminController
  def index
    @activities = Activity.order(:created_at).page(params[:page])
  end
end
