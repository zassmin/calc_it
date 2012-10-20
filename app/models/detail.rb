class Detail < ActiveRecord::Base
  attr_accessible :date_of_birth, :full_name, :gender, :user_id
  belongs_to :user
end
