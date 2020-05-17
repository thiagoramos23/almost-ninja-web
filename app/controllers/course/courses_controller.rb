class Course::CoursesController < ApplicationController
  before_action :authenticate_account!, only: %i[my_courses start_course]
  before_action :set_course, only: %i[show start_course]

  def index
    @courses = ::Course::Course.all_available_courses
    render 'courses/index'
  end

  def my_courses
    @courses = ::Course::Course.user_registered_courses(signed_in_user.id)
    render 'courses/index'
  end

  def show
    if user_already_registered?
      redirect_to course_lectures_path(@course)
    else
      render 'courses/show'
    end
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
    ::Course::Course.user_already_registered_to_course?(@course.id, signed_in_user.id)
  end
end
