module Course
  class LecturesController < ApplicationController
    before_action :authenticate_account!
    before_action :set_course

    def index
      render 'lectures/index'
    end

    def show
    end

    private

    def set_course
      @course = ::Course::Course.find(params[:course_id])
    end
  end
end
