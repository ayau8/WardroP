class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.string :status, default: "pending"
      t.references :user, null: false, foreign_key: true
      t.references :apparel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
