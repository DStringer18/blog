class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.text :photo
      t.timestamps
      t.datetime :archived_at
    end
  end
end
