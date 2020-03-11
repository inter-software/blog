class Comment < ApplicationRecord

  belongs_to :article

  belongs_to :commentable, polymorphic: true

  validates :commenter, presence: true

  validates :body, presence: true

end












































