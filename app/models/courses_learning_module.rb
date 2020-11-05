class CoursesLearningModule < ActiveRecord::Base
  belongs_to :course
  belongs_to :learning_module
end
