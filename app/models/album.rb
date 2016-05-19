class Album  < ActiveRecord::Base

  has_many :songs

  validates :title, presence: true

end
