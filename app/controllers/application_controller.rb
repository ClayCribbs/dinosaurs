class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_to_root
    redirect_to root_url, notice: 'You do not have permission to access the requested page.'
  end

  # def track_activity(trackable, action = params[:action], description = nil)
  #   Activity.create! action: action, trackable: trackable, user: current_user, description: description
  # end
end
