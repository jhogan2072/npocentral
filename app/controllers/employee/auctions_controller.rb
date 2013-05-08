class Employee::AuctionsController < Employee::BaseController
  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def create
    @auction = Auction.new(params[:auction])

    if @auction.save
      redirect_to employee_auction_path(@auction), notice: t('common.created', model: controller_name.classify)
    else
      render action: "new"
    end
  end

  def update
    @auction = Auction.find(params[:id])

    if @auction.update_attributes(params[:auction])
      redirect_to employee_auction_path(@auction), notice: t('common.updated', :model => controller_name.classify)
    else
      render action: "edit"
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy

    redirect_to employee_auctions_path
  end
end
