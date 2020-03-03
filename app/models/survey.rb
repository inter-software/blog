class Survey < ApplicationRecord
  has_many :questions

  has_many :answer_users
  has_many :surveys, through: :answer_users


end
