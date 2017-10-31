class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :report, counter_cache: true
  validates :content, presence: true
end
