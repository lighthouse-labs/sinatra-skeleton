class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :movies do |t|
      t.string :title
      t.integer :year_released
      t.string :director
      t.string :genre
      t.string :studio
      t.integer :rating
      t.timestamps
    end

  end

end