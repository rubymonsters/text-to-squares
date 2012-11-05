class AddPublishTextToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :publish_text, :boolean
  end
end
