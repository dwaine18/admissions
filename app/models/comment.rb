class Comment < ApplicationRecord
  belongs_to :adcom
  belongs_to :student_app
end
