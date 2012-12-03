class AddColorSchemeText < ActiveRecord::Migration
  def change
    add_column :texts, :color_scheme, :string, :default => "blue"
  end
end
