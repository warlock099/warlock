class NftsController < ApplicationController

  def index
    @nfts = Nft.all
  end

  def new
    @nft = Nft.new
  end

  def create
    @nft = Nft.new(nft_params)
    @nft.save
  end

  def show
    @nft = Nft.friendly.find(params[:id])
  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end

  def nft_params
    Params.require(:nft).permit(:title, :image, :date, :description, :link)
  end

end
