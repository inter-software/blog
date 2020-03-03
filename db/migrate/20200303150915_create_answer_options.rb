class CreateAnswerOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_options do |t|
      t.text :text
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
