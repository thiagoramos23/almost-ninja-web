module AuthenticationHandler
  def login_account
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:account]
      user    = ::User.create!(email: 'account@example.com')
      account = ::Account.create!(email: 'account@example.com', password: 'testtestest', password_confirmation: 'testtestest', user: user)
      # account.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in account
    end
  end
end
