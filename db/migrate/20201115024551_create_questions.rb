class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.string :user_id
      t.string :pet_id

      t.timestamps
    end
  end
end
