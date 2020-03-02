class AddPublishedToPublication < ActiveRecord::Migration[6.0]
  def change
    add_reference :publications, :published, polymorphic: true, index: true
  end
end
