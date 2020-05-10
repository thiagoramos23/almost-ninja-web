module Identity
  class User < ApplicationRecord
    self.table_name = 'users'

    has_and_belongs_to_many :courses, class_name: '::Course::Course'
  end
end
