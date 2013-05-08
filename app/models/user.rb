class User < ActiveRecord::Base
  belongs_to :authenticated_entity, polymorphic: true, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  before_save :set_authenticated_entity

  private
  def set_authenticated_entity
    #make authenticated entity an employee if it is null, but will need to change this later
    self.authenticated_entity = Employee.create unless self.authenticated_entity.present?
  end
end
