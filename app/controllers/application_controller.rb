class ApplicationController < ActionController::Base

  protected

  def authenticate_account!
    if account_signed_in?
      super
    else
      redirect_to new_account_session_url
    end
  end

  def signed_in_user
    current_account&.user || anonymous_user
  end

  private

  def anonymous_user
    ::Identity::User.new(name: 'Anonymous')
  end
end
