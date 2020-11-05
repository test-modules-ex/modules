class LearningModule < ActiveRecord::Base
  has_many :courses_learning_modules, class_name: 'CoursesLearningModule'
  has_many :courses, through: :courses_learning_modules
  has_many :learning_module_popularities

  enum module_type: [ :theoretical, :practical, :training ]

  def popularity
    current_popularity.use_count
  end

  def current_popularity
    current_period = learning_module_popularities.current_period
    current_period = LearningModulePopularity.track_popularity(self) if current_period.blank?
    current_period
  end

  def update_popularity
    current_popularity.update_popularity
  end
end
