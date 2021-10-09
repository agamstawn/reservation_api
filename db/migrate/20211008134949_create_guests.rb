class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :adults
      t.integer :children
      t.integer :infants

      t.timestamps
    end
  end
end
