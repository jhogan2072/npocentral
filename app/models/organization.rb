class Organization < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :emails, :as => :contactable, :class_name => "Email"
  has_many :phone_numbers, :as => :contactable, :class_name => "PhoneNumber"
  has_many :websites, :as => :contactable, :class_name => "Website"
end
