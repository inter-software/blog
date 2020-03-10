class Question < ApplicationRecord
  belongs_to :survey, dependent: :destroy# Indicate that question have to survey
  has_many :answer_options
end



