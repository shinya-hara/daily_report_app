class Report < ApplicationRecord
  belongs_to :user
  validates :date,
    uniqueness: { scope: [:user_id] }

  validates :content,
    presence: true
end
