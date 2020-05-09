class Course::CoursesController < ApplicationController
  before_action :authenticate_account!, only: [:my_courses]

  def index
    @courses = ::Course::Course.all_available_courses

    render 'courses/index'
  end

  def my_courses
    @courses = ::Course::Course.user_registered_courses(current_account)
    render 'courses/index'
  end

  def show
    @course = ::Course::Course.find(params[:id])
    render 'courses/show'
  end
end
