class Message < ApplicationRecord

  validates :text, presence: true, length: {minimum: 5}

  def message(msg1, ms2)

    [msg1, ms2].join(", ")

  end

end
