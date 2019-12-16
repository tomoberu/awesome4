class AddAddressToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :address, :text
  end
end
