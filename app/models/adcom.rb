class Adcom < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :programs, through: :school
end
