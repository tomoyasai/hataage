class Message < ApplicationRecord
    belongs_to :user
    has_many :comments
    mount_uploader :image, ImageUploader
    with_options presence: true do
      validates :title
      validates :content
      validates :category_id
      validates :image
    end

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category

end
