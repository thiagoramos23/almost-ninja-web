require 'rails_helper'

describe ::Course::CoursesController, type: %i[controller course] do
  login_account

  let!(:course) { Fabricate :course }

  describe 'GET index' do
    before do
      get :index
    end

    it 'should return all courses' do
      expect(assigns(:courses)).to eq [course]
    end

    it 'should render the index template' do
      expect(response).to render_template("index")
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET my-courses' do
    let!(:registered_course) do
      course = Fabricate :course
      course.users << ::Identity::User.first
      course
    end

    before do
      get :my_courses
    end

    it 'should return all courses the user is registered' do
      expect(assigns(:courses)).to eq [registered_course]
    end

    it 'should render the index template' do
      expect(response).to render_template("index")
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST start-course' do
    let!(:course) do
      Fabricate :course
    end

    before do
      post :start_course, params: { id: course.id }
    end

    it 'register the course to the user' do
      expect(course.reload.users).not_to be_empty
      expect(response).to redirect_to course_lectures_path(course)
      expect(response).to have_http_status(:found)
    end
  end
end
