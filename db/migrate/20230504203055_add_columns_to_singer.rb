class AddColumnsToSinger < ActiveRecord::Migration[7.0]
  def change
    add_column :singers, :name, :string
    add_column :singers, :img_url, :string
    add_column :singers, :music_genre, :string
    add_column :singers, :bio, :text
  end
end
