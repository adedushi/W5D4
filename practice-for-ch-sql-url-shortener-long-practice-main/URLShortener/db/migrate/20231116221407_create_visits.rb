class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.integer :url_id, null: false

      t.timestamps
    end
  end
end
