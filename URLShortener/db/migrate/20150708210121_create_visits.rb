class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :visitor_id, null: false
      t.string :visited_url, null: false
      t.timestamps
    end

    add_index :visits, :visitor_id
    add_index :visits, :visited_url
  end
end
