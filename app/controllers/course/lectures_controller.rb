module Course
  class LecturesController < ApplicationController
    before_action :authenticate_account!
    before_action :set_course
    before_action :set_lecture, only: [:show]

    def index
      redirect_to course_lecture_url(@course, first_lecture)
    end

    def show
      @lectures = ::Course::Lecture.all_course_lectures(@course.id)
      render 'lectures/show'
    end

    private

    def set_course
      @course = ::Course::Course.find(params[:course_id])
    end

    def set_lecture
      @lecture = ::Course::Lecture.find(params[:id])
    end

    def first_lecture
      ::Course::Lecture.first_course_lecture(@course.id)
    end
  end
end
