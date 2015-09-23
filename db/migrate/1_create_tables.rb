class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :pins do |t|
      t.string :name
      t.string :type
      t.string :brand
      t.decimal :price
      t.text :description
      t.timestamps
    end

     create_table :comments do |t|
      t.string :author
      t.string :title
      t.text :description
      t.integer :rating
      t.timestamps
    end

  end

end