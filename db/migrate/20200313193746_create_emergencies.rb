class CreateEmergencies < ActiveRecord::Migration[6.0]
  def change
    create_table :emergencies do |t|

      t.timestamps
    end
  end
end
