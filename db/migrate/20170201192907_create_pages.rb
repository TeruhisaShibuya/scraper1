class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.string :name
      t.string :is_insta

      t.timestamps
    end
  end
end
