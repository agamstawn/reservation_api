class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.belongs_to :guest
      t.string :phone_number

      t.timestamps
    end
  end
end
