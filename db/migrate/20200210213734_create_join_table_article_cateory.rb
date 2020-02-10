class CreateJoinTableArticleCateory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :Articles, :Categories do |t|
      # t.index [:article_id, :category_id]
      # t.index [:category_id, :article_id]
    end
  end
end
