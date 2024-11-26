class CreateCourseCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :course_categories do |t|
      t.string :name
      t.text :note
      t.integer :created_by
      t.string :created_by_name
      t.integer :updated_by
      t.string :updated_by_name

      t.timestamps
    end
  end
end
