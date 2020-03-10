class AnswerOption < ApplicationRecord
  belongs_to :question, dependent: :destroy
  has_many :answer_users
end
