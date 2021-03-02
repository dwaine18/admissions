class Student < ApplicationRecord
    belongs_to :user
    has_many :student_apps
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :sat_score, presence: true
end
