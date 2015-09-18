class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.string :url
      t.date :startdate
      t.date :enddate
      t.binary :binary_data
      t.string :content_type
      t.string :description
      t.string :filename
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
    add_index :contests, [:user_id, :created_at]
  end
end
