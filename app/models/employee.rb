class Employee < ActiveRecord::Base
  has_one :user, as: :authenticated_entity

  delegate :email, to: :user, prefix: false
end
