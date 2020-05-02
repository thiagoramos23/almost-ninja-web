require 'rails_helper'

describe 'Logged in user when click on /my-courses', type: %i[feature course] do

  let(:create_account) do
    Fabricate :account
  end


  before do
    visit_sign_in_and_login_account(create_account)
  end

  context 'When user has registered courses' do
    let!(:registered_courses) do
      account       = ::Account.first
      swift_course  = Fabricate :course
      elixir_course = Fabricate :course, name: 'Elixir With Gods'

      swift_course.users << account.user
      elixir_course.users << account.user
    end

    it 'will show registered courses' do
      visit '/my-courses'
      expect(page).to have_content('SwiftUI and Combine')
      expect(page).to have_content('Elixir With Gods')
    end

  end

  context 'When user has not registered to any course' do
    let!(:courses) do
      Fabricate :course
      Fabricate :course, name: 'Elixir With Gods'
    end

    it 'will not show any courses' do
      visit '/my-courses'
      expect(page).not_to have_content('SwiftUI and Combine')
      expect(page).not_to have_content('Elixir With Gods')
    end
  end
end
