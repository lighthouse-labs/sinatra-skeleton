class PhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.references :contact
      t.string :type
      t.string :number
      t.timestamps null:false
    end
  end
end
