module Course
  class LecturesController < ApplicationController
    before_action :authenticate_account!

    def index
    end

    def show
    end

    private

    def set_lecture
    end
  end
end
