class Adcom < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :programs, through: :school
  validates :first_name, presence: true
  validates :last_name, presence: true
  
end
