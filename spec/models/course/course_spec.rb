require 'rails_helper'

RSpec.describe ::Course::Course, type: :model do
  it { should have_many :tags }
  it { should have_and_belong_to_many :users }

  context 'when has tags' do
    let(:course) do
      course = Fabricate :course 
      course.tags.create(name: 'swiftUI')
      course
    end

    it 'verifies if has tags' do
      expect(course.tags).not_to be_empty
      expect(course.tags.first.name).to eq 'swiftUI'
    end
  end
end
