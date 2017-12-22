class Group < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :users
  validates :name,
    presence: true,
    uniqueness: { message: 'が重複しています' }
end
