class CreateJoinTableArticleCategory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :Articles, :Categories, id: false do |t|
      t.belongs_to :article, foreign_key: true
      t.belongs_to :category, foreign_key: true
    end

  end
end
