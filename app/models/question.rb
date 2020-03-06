class Question < ApplicationRecord
  belongs_to :survey # Indicate that question have to survey
  has_many :answer_options
end



