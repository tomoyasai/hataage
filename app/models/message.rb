class Message < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :content, presence: true, unless: :image?

    mount_uploader :image, ImageUploader

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    validates :category, presence: true

end
