class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :input

      t.timestamps
    end
  end
end
