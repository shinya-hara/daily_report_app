class Group < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :users
  validates :name,
    presence: true,
    uniqueness: { scope: [:user_id], message: 'が重複しています' }
end
