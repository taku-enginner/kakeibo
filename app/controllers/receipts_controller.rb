class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def index
    @receipts = Receipt.joins(:receipt_category)
      .where(
        user_group_id: current_user.user_group.id
      )
        .order(:regist_date)
    @receipt_category_map = {}
    ReceiptCategory.all.each do |category|
      @receipt_category_map[category.id] = category.name
    end
  end

  def show
  end

  def new
    @receipt = Receipt.new(regist_date: Date.current)
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.user_group_id = current_user.user_group.id
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
