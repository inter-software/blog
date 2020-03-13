class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :type
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.date :birthday
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :contacts, [:type, :user_id]
  end
end
