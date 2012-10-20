class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :user_id
      t.string :full_name
      t.string :gender
      t.date :date_of_birth

      t.timestamps
    end
  end
end
