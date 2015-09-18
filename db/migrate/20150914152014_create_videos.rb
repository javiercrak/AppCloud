class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :message
      t.boolean :converted, :default => false
      t.references :contest, index: true, foreign_key: true
      t.attachment :video
      t.timestamps
    end
  end
end
