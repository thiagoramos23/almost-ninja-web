require 'rails_helper'

describe 'Show Course details when clicked in a course', type: %i[feature course] do

  let!(:account) { Fabricate :account }

  context 'When anonymous user selects a course' do
    let!(:swift_course) do
      Fabricate :course,
                name: 'Swift UI',
                total_classes: 6,
                total_repositories: 1,
                length: 120,
                learning_subjects: 'SwiftUI,SwiftUI Stacks,Combine,URLSessions,Animations',
                needed_knowledge: 'Básico de Swift,Básico de Xcode'
    end

    before do
      visit      '/courses'
      click_link 'course-swift-ui'
    end

    it 'shows the swift UI course Detail' do
      expect(page).to have_content(swift_course.name)
      expect(page).to have_content(swift_course.description)

      expect(page).to have_content('6 vídeos (~ about 2 hours de conteúdo)')
      expect(page).to have_content('1 Repositórios completos')

      # Learning Subjects
      expect(page).to have_content('SwiftUI')
      expect(page).to have_content('SwiftUI Stacks')
      expect(page).to have_content('Combine')
      expect(page).to have_content('URLSessions')
      expect(page).to have_content('Animations')

      # Needed Knowledge
      expect(page).to have_content('Básico de Swift')
      expect(page).to have_content('Básico de Xcode')
    end
  end
end
