class CreateTransactionImports < ActiveRecord::Migration
  def change
    create_table :transaction_imports do |t|
      t.integer :user_id
      t.attachment :csv
      t.timestamps
    end
  end
end
