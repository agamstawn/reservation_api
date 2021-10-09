class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :guest
      t.string :code
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nights
      t.integer :guests
      t.string :status
      t.string :currency
      t.float :payout_price
      t.float :security_price
      t.float :total_price

      t.timestamps
    end
  end
end
