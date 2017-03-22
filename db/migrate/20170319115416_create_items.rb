class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :image_url
      t.string :image
      t.string :brand

      t.timestamps
    end
  end
end


     #マイグレーションはテーブルの内容の事をしるしてい模様