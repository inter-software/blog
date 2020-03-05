class CreateAnswerUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_users do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :answer_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
