class Student < ApplicationRecord
    belongs_to :user
    has_many :users, through: :student_apps
end
