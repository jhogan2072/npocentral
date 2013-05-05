# This controller is used for the public site, i.e. the landing page and related pages
class ContentController < ApplicationController
  skip_before_filter :authenticate_user
  layout 'public'
end