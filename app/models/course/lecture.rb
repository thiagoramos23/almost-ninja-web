module Course
  class Lecture < ApplicationRecord
    self.table_name = 'lectures'

    belongs_to :module, optional: true, class_name: 'Course::Lecture', foreign_key: 'parent_lecture_id'
    belongs_to :course, class_name: 'Course::Course'
  end
end
