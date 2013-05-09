class ContactInformation < ActiveRecord::Base
  attr_accessible :contactable_id, :contactable_type, :info, :label, :type
  belongs_to :contactable, :polymorphic => true
end
