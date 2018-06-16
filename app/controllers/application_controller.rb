class ApplicationController < ActionController::Base
  before_action :require_sign_in!

  private

    def require_sign_in!
      redirect_to login_path unless current_user
    end
end
