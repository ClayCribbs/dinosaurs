class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user_photos
  before_action :redirect_to_sign_in

  def redirect_to_root
    redirect_to root_url, notice: 'You do not have permission to access the requested page.'
  end

  def redirect_to_sign_in
    redirect_to new_user_session_path unless current_user.present?
  end

  def set_user_photos
    @my_photos = current_user.present? && current_user.photos.present? ? current_user.my_photos : Photo.none
  end

  # def track_activity(trackable, action = params[:action], description = nil)
  #   Activity.create! action: action, trackable: trackable, user: current_user, description: description
  # end
end
