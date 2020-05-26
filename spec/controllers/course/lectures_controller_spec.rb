require 'rails_helper'

describe ::Course::LecturesController, type: %i[controller course] do
  login_account
  let!(:course)         { Fabricate :course }
  let!(:lecture_module) { Fabricate :lecture, module: nil, course: course }
  let!(:lecture)        { Fabricate :lecture, module: lecture_module, course: course }
  let!(:second_lecture) { Fabricate :lecture, module: lecture_module, course: course }

  describe 'GET index' do
    before do
      get :index, params: { course_id: course.id }
    end

    it 'should redirect to show' do
      expect(response).to redirect_to(course_lecture_path(course, lecture))
    end
  end

  describe 'GET show' do
    before do
      get :show, params: { course_id: course.id, id: lecture.id }
    end

    it 'should assign lecture and lectures variables' do
      expect(assigns(:lecture)).to eq lecture
      expect(assigns(:lectures)).to eq [lecture, second_lecture]
    end

    it 'should render lectures/show' do
      expect(response).to render_template('lectures/show')
      expect(response).to have_http_status(:ok)
    end
  end
end
