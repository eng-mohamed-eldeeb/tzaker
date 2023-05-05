class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :location
      t.references :company, null: false, foreign_key: true
      t.integer :platinum_seats_count
      t.integer :gold_seats_count
      t.integer :silver_seats_count

      t.timestamps
    end
  end
end
