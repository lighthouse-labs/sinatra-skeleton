class SongsForeignKey < ActiveRecord::Migration
  def change
    add_column :songs, :album_id, :integer
  end
end
