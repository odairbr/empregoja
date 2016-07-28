class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs
  validates :name, presence: true

  before_action :authenticate_company!

  def premium?
    jobs.count >= 5
  end
end
