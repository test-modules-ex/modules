class CategoriesCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :category
end
