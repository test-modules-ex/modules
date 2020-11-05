class LearningModulePopularity < ApplicationRecord
  belongs_to :learning_module
  scope :current_period, -> { find_by(period_start: period_start_date) }

  def self.period_start_date
    Date.current.strftime("%Y-%m-01")
  end

  def self.track_popularity(learning_module)
    LearningModulePopularity.create!(period_start: period_start_date, learning_module: learning_module, use_count: 0)
  end

  def update_popularity
    self.use_count += 1
    save!
  end
end
