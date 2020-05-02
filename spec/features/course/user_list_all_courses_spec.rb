require 'rails_helper'

describe 'Logged in user should list all available courses', type: %i[feature course] do

  let(:create_account) do
    Fabricate :account
  end
  
  let!(:setup) do
    Fabricate :course
    Fabricate :course, name: 'Elixir With Gods'
  end

  before do
    visit_sign_in_and_login_account(create_account)
  end

  it 'will show the courses available' do
    expect(page).to have_content('SwiftUI and Combine')
    expect(page).to have_content('Elixir With Gods')
  end
end
