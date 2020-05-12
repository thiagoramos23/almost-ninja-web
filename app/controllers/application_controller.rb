class ApplicationController < ActionController::Base

  protected

  def authenticate_account!
    if account_signed_in?
      super
    else
      redirect_to new_account_session_url
    end
  end
end
