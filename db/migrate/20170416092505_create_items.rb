class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :link_url
      t.string :image_url
      t.string :brands

      t.timestamps
    end
  end
end
