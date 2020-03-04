# frozen_string_literal: true

class User < ApplicationRecord # rubocop:todo Style/Documentation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :verifieds
  has_many :articles, through: :verifieds
  has_many :questions

  has_many :answer_users, dependent: :destroy
  has_many :surveys, through: :answer_users

  validates :email, presence: true
  validates :password, presence: true
end
