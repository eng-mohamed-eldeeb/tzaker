class AddColumnsToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :name, :string
    add_column :companies, :img_url, :string
    add_column :companies, :location, :string
    add_column :companies, :bio, :text
  end
end
