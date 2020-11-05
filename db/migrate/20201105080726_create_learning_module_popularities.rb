class CreateLearningModulePopularities < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_module_popularities do |t|
      t.date :period_start, null: false
      t.references :learning_module, null: false
      t.integer :use_count, null: false
    end
  end
end
