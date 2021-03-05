class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :text, presence: true
end
