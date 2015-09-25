class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :pins do |t|
            t.references :user
            #a user has pins
        end
    end
end

class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :comments do |t|
            t.references :pin
            t.references :user
            #a pin has comments
        end
    end
end



