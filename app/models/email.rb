class Email < ContactInformation
  # any validation for email can go here 
  #Constants for email types
  EMAIL_TYPES = [ 'email.types.personal', 'email.types.work', 'email.types.other']
  validates :label, inclusion: EMAIL_TYPES
end