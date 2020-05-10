require 'rails_helper'

describe 'Course Repository', type: %i[model repository course] do
  let(:swift_course) { Fabricate :course, name: 'Swift UI' }
  let(:elixir_course) { Fabricate :course, name: 'Elixir With Gods' }

  describe '.all_available_courses' do
    context 'When have courses available' do
      before do
        swift_course
        elixir_course
      end

      it 'returns all available courses' do
        result = ::Course::Course.all_available_courses
        expect(result).not_to be_empty
        expect(result.count).to eq 2
        expect(result.first).to eq swift_course
        expect(result.last).to eq elixir_course
      end

      context 'When have tags associated' do
        let(:swfit_course_tags)  { swift_course.tags.create!(name: 'swiftUI') }

        before do
          swift_course
          swfit_course_tags
          elixir_course
        end

        it 'returns with tags' do
          result = ::Course::Course.all_available_courses
          expect(result).not_to be_empty
          tags = result.first.tags
          expect(tags).not_to be_empty
          expect(tags.first.name).to eq 'swiftUI'
        end

      end
    end

    context 'When does not have courses available' do
      it 'returns an empty list' do
        result = ::Course::Course.all_available_courses
        expect(result).to be_empty
      end
    end
  end

  describe '.user_registered_courses' do
    let!(:account) { Fabricate :account }

    context 'When have registered courses' do
      let!(:register_swift_course)  { swift_course.users << account.user }
      let!(:register_elixir_course) { elixir_course.users << account.user }
      let!(:unregistered_course)    { Fabricate :course, name: 'Unregistered Course' }

      it 'returns the registered courses for the user' do
        result = ::Course::Course.user_registered_courses(account.user.id)
        expect(result).not_to be_empty
        expect(result.count).to eq 2
        expect(result.first.name).to eq swift_course.name
        expect(result.last.name).to eq elixir_course.name
      end
    end

    context 'When does not have any registered course' do
      it 'returns empty' do
        result = ::Course::Course.user_registered_courses(account.user.id)
        expect(result).to be_empty
      end
    end
  end

  describe '.user_already_registered_to_course?' do
    let!(:account) { Fabricate :account }

    context 'When user has registered to course' do
      let!(:registered_swift_course)  { swift_course.users << account.user }

      it 'returns true' do
        result = ::Course::Course.user_already_registered_to_course?(swift_course.id, account.user.id)
        expect(result).to be_truthy
      end
    end

    context 'When user has NO registered to the course' do
      it 'returns false' do
        result = ::Course::Course.user_already_registered_to_course?(swift_course.id, account.user.id)
        expect(result).to be_falsey
      end
    end
  end
end
