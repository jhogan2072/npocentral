class Contact < ActiveRecord::Base
  has_one :user, as: :authenticated_entity
  belongs_to :account

  delegate :email, to: :user, prefix: false
end
