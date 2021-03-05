# hataage DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :messages
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :like_messages, through: :likes, source: :message

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|image|string|
|category_id|integer|null: false|

### Association
- belongs_to :user
- has_many :comments
- has_many :messages_tags
- has_many  :tags,  through:  :messages_tags
- has_many :likes, dependent: :destroy
- has_many :users, through: :likes

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :messages_tags
- has_many  :messages,  through:  :messages_tags

## messages_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|message_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :message
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :message
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|message_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :message
- belongs_to :user