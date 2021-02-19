class Adcom < ApplicationRecord
  has_many :users
  belongs_to :school
  has_many :programs, through: :school
end
