class Friend < Contact < ApplicationRecord
  #Relaschip
  belongs_to :user

  #Validatios
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end
