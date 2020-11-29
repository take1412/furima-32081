class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    # 商品一覧機能実装時に使用 → @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create  
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :charge_id, :prefecture_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

end
