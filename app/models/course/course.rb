module Course
  class Course < ApplicationRecord
    self.table_name = 'courses'

    extend ::Course::Repository::CourseRepository

    include Taggable

    belongs_to :author, class_name: 'Identity::User'
    has_and_belongs_to_many :users, class_name: '::Identity::User'
    has_many :lectures, class_name: 'Course::Lecture'
  end
end
