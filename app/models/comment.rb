# frozen_string_literal: true

class Comment < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :article

  # scope :active_comments, -> {where(active: true)}

  # scope :inactive_comments, -> {where(active: false)}

  validates :commenter, presence: true

  validates :body, presence: true
end
