class Company < ApplicationRecord
  has_many :jobs
  validates :name, presence: true

  def premium?
    jobs.count >= 5
  end
end
