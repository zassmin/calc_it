class Transaction < ActiveRecord::Base
  belongs_to :user

  attr_accessible :amount, :description, :post_date, :transaction_date, :transaction_type, :user_id, :transaction_import_id

  validates_presence_of :transaction_type, :amount, :post_date, :transaction_date, :description
  validates :amount, :numericality => true

  def self.trans_type
    ['Payment', 'Sale']
  end

end
