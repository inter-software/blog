class Contact < ApplicationRecord

  # Scopes
  scope :friends, -> { where(type: 'Friend') }
  scope :emergencies, -> { where(type: 'Emergency') }
end
