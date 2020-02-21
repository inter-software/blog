# frozen_string_literal: true

class Comment < ApplicationRecord # rubocop:todo Style/Documentation

  belongs_to :article

  validates :commenter, presence: true

  validates :body, presence: true


  def report_comment

    "My Comments: #{commenter}, #{body}"

  end
  
  def search_comment

    ['Anna', 'carlos', 'charly', 'esteban'].include?(:commenter)

  end
end












































