class CreateTypeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :type_categories do |t|
      t.string :name
      t.boolean :public

      t.timestamps
    end
  end
end
