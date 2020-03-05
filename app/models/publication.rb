class Publication < ApplicationRecord
  belongs_to :published, polymorphic: true
end
