class Question < ApplicationRecord
  belongs_to :survey
  has_many :answer_options
end
