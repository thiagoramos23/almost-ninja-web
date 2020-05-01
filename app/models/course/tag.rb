module Course 
  class Tag < ApplicationRecord
    self.table_name = 'tags'

    belongs_to :taggable, polymorphic: true
  end
end
