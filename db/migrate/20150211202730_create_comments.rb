class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.string :email
      t.string :name
      t.integer :blog_post_id

      t.timestamps null: false
    end
  end
end
