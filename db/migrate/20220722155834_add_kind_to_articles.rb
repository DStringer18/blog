class AddKindToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :kind, :string
  end
end
