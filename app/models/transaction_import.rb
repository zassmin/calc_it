class TransactionImport < ActiveRecord::Base

  belongs_to :user
  has_one :transasction_import

  attr_accessible :user_id, :csv

  validate :csv

  before_create :randomize_file_name

  has_attached_file :csv,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => '/:style/:filename'

  validates_attachment_presence :csv
  validates_attachment_content_type :csv, :content_type => ['text/comma-separated-values','text/csv','application/csv', 'application/excel', 'application/vnd.ms-excel', 'application/vnd.msexcel'], :message => 'Only files with .csv extension can be uploaded.'

  private

  def randomize_file_name
    extension = File.extname(csv_file_name).downcase
    o     = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    name  =  (0...50).map{ o[rand(o.length)] }.join
    self.csv.instance_write(:file_name, "#{name}#{extension}")
  end


  def self.parse(user_id, file)
    begin
    require 'CSV'
    file_contents = open(file.csv.url) {|f| f.read }
    CSV.parse(file_contents, :headers => :true) do |row|
      Transaction.create!(  transaction_import_id: file.id,
                            user_id: user_id,
                            amount: row[5],
                            description: row[3].split(' ').each{|word| word.capitalize!}.join(' '),
                            post_date: row[2],        #, Date.strptime(row[2], "%d/%m/%Y"),
                            transaction_date: row[1], #Date.strptime(row[1], "%d/%m/%Y"),
                            transaction_type: row[0]
                          )
      end
    rescue
      logger.debug "CSV clapped out"
      last_transaction_import = self.where(user_id: user_id).last
      last_transaction_import.destroy
      error = 'Your CSV is malformed and so cannot be imported. Please clean it up and try again.'
      return error
    end
  end

end
