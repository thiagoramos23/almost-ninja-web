require 'rails_helper'

describe 'Lecture Repository', type: %i[repository lecture] do
  let(:course)          { Fabricate :course }
  let(:lecture_module)  { Fabricate :lecture, course: course, module: nil }

  context 'When wants to get the first lecture that has parent in a course' do
    let!(:first_lecture)  { Fabricate :lecture, course: course, module: lecture_module }

    it 'returns the first lecture of the course' do
      result = ::Course::Lecture.first_course_lecture(course.id)
      expect(result).to be_a(::Course::Lecture)
      expect(result.title).to eq first_lecture.title
    end
  end

  context 'When wants to get all course lectures' do
    let!(:first_lecture)  { Fabricate :lecture, title: 'First', lecture_order: 1, course: course, module: lecture_module }
    let!(:second_lecture) { Fabricate :lecture, title: 'Second', lecture_order: 2, course: course, module: lecture_module }
    let!(:third_lecture)  { Fabricate :lecture, title: 'Third', lecture_order: 3, course: course, module: lecture_module }

    it 'returns all non module lectures for the course in order' do
      result = ::Course::Lecture.all_course_lectures(course.id)
      expect(result.count).to eq 3
      expect(result[0]).to eq first_lecture
      expect(result[1]).to eq second_lecture
      expect(result[2]).to eq third_lecture
    end
  end
end
