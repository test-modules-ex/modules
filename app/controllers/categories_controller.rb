class CategoriesController < ApplicationController
  def index
    @categories = Category.all.includes(courses: :learning_modules)
      .to_json(include: { courses: { include: :learning_modules } } )
    render json: @categories
  end

  def list
  end
end
