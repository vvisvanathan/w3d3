class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.string :tag_id, null: false
      t.string :tagger_id, null: false
      t.string :url_id, null: false

      t.timestamps null: false
    end

    create_table :tag_topics do |t|
      t.string :tag, null: false

      t.timestamps null: false
    end

    add_index :taggings, :tagger_id
    add_index :taggings, :url_id
    add_index :tag_topics, :tag, unique: true
  end
end
