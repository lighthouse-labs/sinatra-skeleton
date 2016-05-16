class Albums < ActiveRecord::Migration
  def change
    create_table :albums do |al|
      al.string :title
      al.string :record_label
      al.date :release_date
    end
  end
end
