class Report < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :date,
    uniqueness: { scope: [:user_id] }

  validates :content,
    presence: true
end
