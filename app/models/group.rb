class Group < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :users
end
