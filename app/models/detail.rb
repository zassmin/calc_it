class Detail < ActiveRecord::Base
  attr_accessible :date_of_birth, :full_name, :gender, :user_id
  belongs_to :user

  validates_presence_of :gender, :full_name, :user_id

  def self.gender
    ['Male', 'Female', 'Opt Out']
  end

end
