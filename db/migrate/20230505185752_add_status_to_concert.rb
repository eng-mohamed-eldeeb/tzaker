class AddStatusToConcert < ActiveRecord::Migration[7.0]
  def change
    add_column :concerts, :status, :string
  end
end
