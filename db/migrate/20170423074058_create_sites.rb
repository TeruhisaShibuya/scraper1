class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.string :crawl  #クローリングする構造部分を確認するカラム

      t.timestamps
    end
  end
end
