class AnswerOption < ApplicationRecord
  belongs_to :question
  has_many :answer_users
end
