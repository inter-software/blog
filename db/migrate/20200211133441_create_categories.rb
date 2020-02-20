# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
