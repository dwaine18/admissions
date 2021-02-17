class Program < ApplicationRecord
  belongs_to :school 
  has_many :applicants, through: :school
  has_many :adcoms, through: :school
end
