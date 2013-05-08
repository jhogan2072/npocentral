class Auction < ActiveRecord::Base
  attr_accessible :description, :event_date, :name
  belongs_to :account
  validates_presence_of :name

  def self.current_auction_name(current_session)
    if current_session[:auction_name].nil?
      find(current_session[:auction_id]).name unless current_session[:auction_id].nil?
    else
      current_session[:auction_name]
    end
  end
end
