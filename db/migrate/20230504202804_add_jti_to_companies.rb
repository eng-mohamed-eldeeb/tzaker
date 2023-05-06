class AddJtiToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :jti, :string
    add_index :companies, :jti
  end
end
