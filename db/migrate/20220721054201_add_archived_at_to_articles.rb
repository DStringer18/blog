class AddArchivedAtToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :archived_at, :datetime
  end
end
