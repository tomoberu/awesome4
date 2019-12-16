class AddAgeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :age, :text
  end
end
