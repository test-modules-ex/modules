class CreateLearningModules < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_modules do |t|
      t.string :name, null: false
      t.integer :module_type, null: false
      t.text :description
      t.integer :difficulty, null: false
    end
  end
end
