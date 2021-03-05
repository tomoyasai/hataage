class Message < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :users, through: :likes
    has_many :comments 
    mount_uploader :image, ImageUploader
    with_options presence: true do
      validates :title
      validates :content
      validates :category_id
      validates :image
    end

    def liked_by?(user)
      likes.where(user_id: user.id).exists?
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
