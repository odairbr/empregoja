class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category
  validates :title, :location, :description, :category, presence: true
end
