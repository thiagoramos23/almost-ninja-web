module Course
  class Course < ApplicationRecord
    self.table_name = 'courses'

    extend ::Course::Repository::CourseRepository

    include Taggable

    has_and_belongs_to_many :users, class_name: '::Identity::User'
  end
end
