class BuyInfosController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user = User.find(current_user.id)
    @buy_form = BuyForm.new
  end

  def create
    @buy_form = BuyForm.new(buy_params)
    if @buy_form.valid?
      @buy_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  def buy_params
    params.require(:buy_form).permit(:postal_code, :prefecture_id, :city, :house_num, :house_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
