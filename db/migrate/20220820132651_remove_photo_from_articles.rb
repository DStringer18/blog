class RemovePhotoFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :photo, :text
  end
end
