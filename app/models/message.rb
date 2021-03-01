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

  def self.search(search)
    if search != ""
      Message.where('title LIKE(?)', "%#{search}%")
    else
      Message.all
    end
  end

end
