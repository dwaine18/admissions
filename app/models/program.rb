class Program < ApplicationRecord
  belongs_to :school 
  has_many :student_apps, through: :school
  has_many :adcoms, through: :school
  has_many :students
  validates :program_name, presence: true
  validates :description, presence: true
end
