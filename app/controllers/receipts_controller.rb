class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  before_action :regist_receipt_category

  def index
    if current_user.user_group_id.nil?
      @receipts = Receipt.joins(:receipt_category)
        .where(
          user_id: current_user.id
        )
          .order(:regist_date)
    else
      @receipts = Receipt.joins(:receipt_category)
        .where(
          user_group_id: current_user.user_group.id
        )
          .order(:regist_date)
    end
    @receipt_category_map = {}
    ReceiptCategory.all.each do |category|
      @receipt_category_map[category.id] = category.name
    end
  end

  def show
  end

  def new
    @receipt = Receipt.new(regist_date: Date.current)
    @receipt_categories = ReceiptCategory.where(user_group_id: current_user.user_group_id)
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.user_id = current_user.id
    @receipt.user_group_id = current_user.user_group.id if !current_user.user_group_id.nil?
    if @receipt.save
      redirect_to calendar_path(Date.current), notice: "レシートを記録しました"
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

  def regist_receipt_category
    # ユーザーが所属するグループがレシートカテゴを持たない場合
    if current_user.user_group_id and ReceiptCategory.find_by(user_group_id: current_user.user_group_id).nil?
      redirect_to receipt_categories_path, notice: "レシート登録の前にカテゴリを作ってください"
    # グループに所属しないユーザーがレシートカテゴリを持たない場合
    elsif ReceiptCategory.find_by(user_id: current_user.id).nil?
      redirect_to receipt_categories_path, notice: "レシート登録の前にカテゴリを作ってください"
    end
  end
end
