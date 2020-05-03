require 'rails_helper'

describe 'Show Course details when clicked in a course', type: %i[feature course] do

  let!(:account) { Fabricate :account }

  context 'When anonymous user selects a course' do
    let!(:swift_course) do
      Fabricate :course,
                name: 'Swift UI',
                description: 'Learn iOS using SwiftUI with Combine and embrace the power of the new Apple UI Framework'
    end

    before do
      visit      '/courses'
      click_link 'course-swift-ui'
    end

    it 'shows the swift UI course Detail' do
      expect(page).to have_content(swift_course.name)
      expect(page).to have_content(swift_course.description)
    end
  end
end
