class CreateWelcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :welcomes do |t|
      t.string :salute
      t.text :comment

      t.timestamps
    end
  end
end
