class StudentApp < ApplicationRecord
  belongs_to :student
  belongs_to :program
  has_one :comment
  accepts_nested_attributes_for :comment
  has_many :adcoms, through: :program
  has_many :users, through: :student
  has_many :schools, through: :program
  validates :student_id, presence: true
  validates :program_id, presence: true
  validates :essay, presence: true
  
end
