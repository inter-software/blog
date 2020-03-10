class Survey < ApplicationRecord

  has_many :questions, dependent: :destroy # Indicate that the survey have many to questions

  #Mapping to the answer_users (Many-to-Many)
  has_many :answer_users
  has_many :users, through: :answer_users

  #Validates Associations
  validates_associated :questions

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true





end
