class Account < ActiveRecord::Base
  attr_accessible :description, :full_domain, :name
  validates_presence_of :name, :full_domain
  #has_many :users, dependent: :destroy
  #has_one :owner, class_name: 'User', conditions: { :owner => true }
  #accepts_nested_attributes_for :owner
  has_many :auctions, dependent: :destroy
  validates_format_of :domain, with: /\A[a-zA-Z][a-zA-Z0-9]*\Z/
  validates_exclusion_of :domain, in: %W( support blog www billing help api ), message: I18n.t('account.domainnotavailable')
  #validates :owner, presence: {on: :create, message: I18n.t('account.ownermissing')}
  validate :valid_domain?

  def domain
    @domain ||= self.full_domain.blank? ? '' : self.full_domain.split('.').first
  end

  def domain=(domain)
    @domain = domain
    self.full_domain = "#{domain}.#{APP_CONFIG['base_domain'].split(':').first}"
  end

  def to_s
    name.blank? ? full_domain : "#{name} (#{full_domain})"
  end

protected
  def valid_domain?
    conditions = new_record? ? ['full_domain = ?', self.full_domain] : ['full_domain = ? and id <> ?', self.full_domain, self.id]
    self.errors.add(:domain, I18n.t('account.isnotavailable')) if self.full_domain.blank? || self.class.count(:conditions => conditions) > 0
  end

end
