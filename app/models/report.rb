class Report < ApplicationRecord
  validates :content,
    presence: true
end
