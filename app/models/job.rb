class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category

  DAYS_TO_EXPIRE = 90

  validates :title, :location, :description, :category, presence: true


  def expired?
    created_at < DAYS_TO_EXPIRE.days.ago
  end
end
