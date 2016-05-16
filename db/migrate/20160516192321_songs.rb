class Songs < ActiveRecord::Migration
  def change
    create_table :songs do |s|
      s.string :name
      s.string :artist
      s.integer :likes
    end
  end
end
