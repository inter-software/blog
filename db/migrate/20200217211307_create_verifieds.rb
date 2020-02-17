class CreateVerifieds < ActiveRecord::Migration[6.0]
  def change
    create_table :verifieds do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.text :comment

      t.timestamps
    end
  end
end
