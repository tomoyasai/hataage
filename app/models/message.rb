class Message < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :content, presence: true, unless: :image?
end
