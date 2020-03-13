class Publication < ApplicationRecord

  # relationships
  has_many :comments, as: :commentable

  #Scopes
  default_scope {order(created_at: :desc)} # Scope Default
  scope :with_long_name, -> (max, min){where('LENGTH(name) >= ? && LENGTH(name) < ?', min, max)} # With two parameters
  scope :with_long_name2, -> (length){where('LENGTH(name) >= ?', length)} # Scopes with arguments
  scope :date_today, -> {where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)} #Scopes with Range to the Dates
  scope :found_publications, ->  {where(status: 0)}
  scope :publication_wanted, -> {where(statuses.first(2).to_h)}
  scope :publication_return, -> {where(statuses.to_a.first(2).to_h)}

  #Scope as Class Method
  def self.with_name (name=20)
    where('name > ?', name)
  end


end
