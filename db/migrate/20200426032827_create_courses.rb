class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :length
      t.string :description
      t.string :html_description

      t.timestamps
    end
  end
end
