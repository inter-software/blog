class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :survey_name
      t.text :survey_desc
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
