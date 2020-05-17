class AddAuthorToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :author_id, :bigint
    add_foreign_key :courses, :users, column: :author_id
  end
end
