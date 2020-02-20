# frozen_string_literal: true

class AddAttachmentsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :attachments, :json
  end
end
