class AddJtiToSingers < ActiveRecord::Migration[7.0]
  def change
    add_column :singers, :jti, :string
    add_index :singers, :jti
  end
end
