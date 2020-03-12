class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true

  belongs_to :article

  validates :commenter, presence: true

  validates :body, presence: true

end












































