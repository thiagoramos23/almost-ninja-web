class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :taggable, polymorphic: true, null: false
      t.string :name
    end
  end
end
