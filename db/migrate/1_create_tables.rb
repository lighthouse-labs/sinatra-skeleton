class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :movies do |t|
      t.string :name
      t.string :year_released
      t.integer :parent_rating
      t.string :studio
      t.timestamps
    end

    create_table :reviews do |t|
      t.text :review
      t.integer :user_rating
      t.timestamps
    end
  end

end