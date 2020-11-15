class AddColumnToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :user_id, :string
    add_column :pets, :image_id, :string
  end
end
