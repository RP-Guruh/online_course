class CreateCourseSubCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :course_sub_categories do |t|
      t.string :name
      t.text :note
      t.references :course_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
