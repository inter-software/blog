class AnswerUser < ApplicationRecord
  belongs_to :survey
  belongs_to :user
  belongs_to :answer_option
end
