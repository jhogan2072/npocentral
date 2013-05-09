class Employee < ActiveRecord::Base
  has_one :user, as: :authenticated_entity
  belongs_to :account
  has_many :emails, :as => :contactable, :class_name => "Email"
  has_many :phone_numbers, :as => :contactable, :class_name => "PhoneNumber"
  has_many :websites, :as => :contactable, :class_name => "Website"
  delegate :email, to: :user, prefix: false
end
