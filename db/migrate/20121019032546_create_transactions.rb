class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :transaction_type
      t.datetime :transaction_date
      t.datetime :post_date
      t.string :description
      t.float :amount

      t.timestamps
    end
  end
end
