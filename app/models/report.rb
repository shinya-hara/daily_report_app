class Report < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments
  validates :date,
    uniqueness: { scope: [:user_id], message: 'が重複しています' }

  validates :content,
    presence: true
end
