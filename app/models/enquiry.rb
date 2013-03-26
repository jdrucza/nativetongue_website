class Enquiry < ActiveRecord::Base
  attr_accessible :content, :email, :name
  validates_presence_of :email, :name
end
