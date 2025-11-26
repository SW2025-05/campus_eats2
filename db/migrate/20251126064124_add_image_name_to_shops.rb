class AddImageNameToShops < ActiveRecord::Migration[8.0]
  def change
    add_column :shops, :image_name, :string
  end
end
