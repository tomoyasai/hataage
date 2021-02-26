class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :image, null: false
      t.text :title, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end


