class User < ActiveRecord::Base
    validates :username, :email, presence: true

    validates :email, uniqueness: true
end
