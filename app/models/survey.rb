class Survey < ApplicationRecord

  has_many :questions, dependent: :destroy # Indicate that the survey have many to questions

  has_many :answer_users, dependent: :destroy
  has_many :users, through: :answer_users


end
