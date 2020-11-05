class CreateModulesCourses < ActiveRecord::Migration[6.0]
  def change
    create_join_table :learning_modules, :courses do |t|
      t.index :learning_module_id
      t.index :course_id
    end
  end
end
