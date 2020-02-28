class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :message
      t.string :user_name

      t.timestamps
    end
  end
end
