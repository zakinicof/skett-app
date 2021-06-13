class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title,               null: false
      t.date :match_date,            null: false
      t.string :match_site,          null: false
      t.integer :prefecture_code_id, null: false
      t.integer :recruit_count,      null: false
      t.text :content,               null: false
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
