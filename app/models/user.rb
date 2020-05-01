class User < ApplicationRecord
  has_and_belongs_to_many :courses, class_name: '::Course::Course'
end
