class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :title
      t.string :comment
      t.string :purchase_cost
      t.string :initial_cost
      t.string :place
      t.string :cost
      t.string :lifespan
      t.string :length
      t.string :weight
      t.text :personality
      t.text :care
      t.text :food
      t.text :attention
      t.integer :user_id
      t.string :image_id
      t.integer :category_id
      t.timestamps
    end
  end
end
