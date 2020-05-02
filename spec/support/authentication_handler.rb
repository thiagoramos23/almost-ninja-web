require 'capybara/dsl'

module AuthenticationHandler
  include Capybara::DSL
    
  def login_account
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:account]
      user    = ::User.create!(email: 'account@example.com')
      account = ::Account.create!(email: 'account@example.com', password: 'testtestest', password_confirmation: 'testtestest', user: user)
      # account.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in account
    end
  end

  def visit_sign_in_and_login_account(account)
    visit '/account/sign_in'
    fill_in 'account_email', with: account.email
    fill_in 'account_password', with: account.password
    click_button 'Log in'
  end
end
