class Course::CoursesController < ApplicationController
  before_action :authenticate_account!, only: [:my_courses, :start_course]
  before_action :set_course, only: [:show, :start_course]

  def index
    @courses = ::Course::Course.all_available_courses
    render 'courses/index'
  end

  def my_courses
    @courses = ::Course::Course.user_registered_courses(current_account.user.id)
    render 'courses/index'
  end

  def show
    render 'courses/show'
  end

  def continue_course
    # Redirect to the show passing the last lecture
  end

  def start_course
    @course.users << current_account.user
    redirect_to course_lectures_path(@course)
  end

  private

  def set_course
    @course = ::Course::Course.find_course(params[:id])
  end

  def user_already_registered?
    ::Course::Course.user_already_registered_to_course?
  end
end
