class CreateConcerts < ActiveRecord::Migration[7.0]
  def change
    create_table :concerts do |t|
      t.integer :silver_seats_price
      t.integer :gold_seats_price
      t.integer :platinum_seats_price
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.references :singer, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
