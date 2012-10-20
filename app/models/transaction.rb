class Transaction < ActiveRecord::Base
  attr_accessible :amount, :description, :post_date, :transaction_date, :transaction_type, :user_id
  belongs_to :user
  validates_presence_of :description
end
