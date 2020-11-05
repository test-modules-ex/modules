class LearningModulesController < ApplicationController
  def index
    @learning_modules = LearningModule.all.includes(:learning_module_popularities)
    render json: @learning_modules.map { |lm| lm.attributes.merge(popularity: lm.popularity) }
  end

  def update_popularity
    @learning_module = LearningModule.find(params[:learning_module_id])
    @learning_module.update_popularity
  end
end
