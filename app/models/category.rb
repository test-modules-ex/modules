class Category < ActiveRecord::Base
  has_many :categories_courses, class_name: 'CategoriesCourse'
  has_many :courses, through: :categories_courses
  has_many :learning_modules, through: :courses
end
