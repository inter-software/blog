class Publication < ApplicationRecord
  has_many :comments, as: :commentable
end
