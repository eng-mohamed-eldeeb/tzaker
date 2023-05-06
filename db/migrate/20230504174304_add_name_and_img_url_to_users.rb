class AddNameAndImgUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :img_url, :string
  end
end
