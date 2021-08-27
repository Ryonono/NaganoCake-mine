class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    @item.save!
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @genres = Genre.all
    @item.update(item_params)
    redirect_to admin_items_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :genre_id, :is_released)
  end


end
