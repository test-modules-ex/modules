class CreateCoursesCategories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :courses, :categories do |t|
      t.index :course_id
      t.index :category_id
    end
  end
end
