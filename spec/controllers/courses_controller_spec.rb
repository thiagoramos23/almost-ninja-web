require 'rails_helper'

describe ::Courses::CoursesController do
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
      course.users << ::User.first
    end
    

    before do
      get 'courses/my_courses'
    end

    it 'should return all courses the user is registered' do
      expect(assigns(:courses)).to eq [registered_course]
    end

    it 'should render the index template' do
      expect(response).to render_template("index")
      expect(response).to have_http_status(:ok)
    end
  end
end
