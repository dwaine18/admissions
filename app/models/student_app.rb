class StudentApp < ApplicationRecord
  belongs_to :student
  belongs_to :program
  has_many :adcoms, through: :program
  has_many :users, through: :student
end
