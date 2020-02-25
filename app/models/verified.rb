# frozen_string_literal: true

class Verified < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :article
  belongs_to :user
end
