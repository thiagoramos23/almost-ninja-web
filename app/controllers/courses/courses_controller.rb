class Courses::CoursesController < ApplicationController
  before_action :authenticate_account!

  def index
    @courses = ::Course::Course.includes(:tags).all
    render 'courses/index'
  end

  def my_courses
    # @courses = ::Course::Course.user_registered_courses(current_account)
    @courses = current_account.user.courses.includes(:tags).all
    render 'courses/index'
  end

  def show
    @course = ::Course::Course.find(params[:id])
  end
end
