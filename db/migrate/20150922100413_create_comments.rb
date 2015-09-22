class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
