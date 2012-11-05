class ChangePublishTextToBoolean < ActiveRecord::Migration
  def change
    change_table :texts do |t|
      t.change_default(:publish_text, true)
    end
  end
end

