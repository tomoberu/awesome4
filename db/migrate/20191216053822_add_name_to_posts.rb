class AddNameToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :name, :text
  end
end
