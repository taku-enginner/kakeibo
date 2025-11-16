class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def index
    @receipts = Receipt.all
  end

  def show
  end

  def new
    @receipt = Receipt.new(regist_date: Date.current)
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.user_id = current_user.id
    if @receipt.save
      redirect_to receipts_path, notice: "レシートを記録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def receipt_params
    params.require(:receipt).permit(:memo, :price, :regist_date, :receipt_category_id)
  end
end
