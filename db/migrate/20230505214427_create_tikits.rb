class CreateTikits < ActiveRecord::Migration[7.0]
  def change
    create_table :tikits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :concert, null: false, foreign_key: true
      t.string :seat_type

      t.timestamps
    end
  end
end
