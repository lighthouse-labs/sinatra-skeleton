class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content
      t.string :img_url
      t.references :user
      t.timestamps
    end
  end
end