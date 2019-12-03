class ApplicationController < ActionController::Base
  before_action :genre
  def genre
    @genres = Genre.all
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
