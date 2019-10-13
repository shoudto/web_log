class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :brewery
      t.string :name
      t.string :body
      t.integer :user_id
      t.timestamps
    end
  end
end
