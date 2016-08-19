class ItemsController < ApplicationController

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    respond_with Item.create(item_params)
  end

  def update # TODO: No anda esto, ver que devuelve
    item = Item.find(params[:id])
    item.name = params[:item][:name]
    item.show = params[:item][:show]
    item.save!

    respond_with item
  end

  def destroy
    Item.find(params[:id]).destroy!

    respond_with Item.all
  end

  def show_or_hide
    item = Item.find(params[:id])
    item.show = !item.show
    item.save!

    respond_with item.show
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :show)
  end
  
end
