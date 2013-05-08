class AccountsController < ApplicationController
  #before_filter :authenticate_user!, except: [ :new, :create, :siteaddress, :loginredirect ]
  #before_filter :build_user, :only => [:new, :create]
  layout :resolve_layout

#  def change_owner
#    @account = current_account
#    if request.post? || request.put?
#      #Make the change to the users involved
#      previous_owner = User.find(params[:account][:current_owner_id])
#      new_owner = User.find(params[:account][:owner_id])
#      if
#      previous_owner.update_attribute(:owner, false) && new_owner.update_attribute(:owner, true)
#        flash[:notice] = I18n.t('account.accountupdated') + " - " + I18n.t('account.newowneris') + ": " + params[:account][:owner_full_name]
#        redirect_to root_url
#      else
#        render :action => 'change_owner'
#      end
#    end
#  end

  # The siteaddress action just redirects to a page that will prompt the user for their site address then redirect them to their login page
  def siteaddress
    render :layout => 'public' # Uncomment if your "public" site has a different layout than the one used for logged-in users
  end

  def loginredirect
    redirect_to url_for("http://" << params[:siteaddress] << "." << APP_CONFIG['base_domain'])
  end

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: t('common.created', model: human_name) }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: t('common.updated', model: human_name) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

protected
  #def build_user
  #  build_resource.owner = User.new unless build_resource.owner
  #end

private
  def resolve_layout
    case action_name
      when 'siteaddress'
        'public'
      when 'new'
        'public'
      when 'edit'
        'application'
      else
        'application'
    end
  end
end

