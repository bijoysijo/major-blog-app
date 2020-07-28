class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]

  def after_sign_out_path_for(user)
    posts_path
  end
end
