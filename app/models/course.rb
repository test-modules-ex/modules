class Course < ActiveRecord::Base
  has_many :courses_learning_modules, class_name: 'CoursesLearningModule'
  has_many :learning_modules, through: :courses_learning_modules

  has_many :categories_courses, class_name: 'CategoriesCourse'
  has_many :categories, through: :categories_courses
end
