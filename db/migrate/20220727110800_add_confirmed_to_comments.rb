class AddConfirmedToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :confirmed, :boolean
  end
end
