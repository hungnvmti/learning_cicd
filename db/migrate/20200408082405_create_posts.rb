class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, comment: 'posts table'  do |t|
      t.string :name
      t.string :description, comment: 'description'
      t.timestamps null: false
    end
  end
end
