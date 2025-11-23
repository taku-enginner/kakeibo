class ReceiptCategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.user_group_id
      @receipt_categories = ReceiptCategory.where(user_group_id: current_user.user_group_id).order(food_related: :desc)
    else
      @receipt_categories = ReceiptCategory.where(user_id: current_user.id).order(food_related: :desc)
    end
    @receipt_category = ReceiptCategory.new
  end

  def show
    @receipt_category = ReceiptCategory.find(params['id'])
  end

  def create
    @receipt_category = ReceiptCategory.new(receipt_category_params)
    @receipt_category.user_id = current_user.id
    if @receipt_category.save
      redirect_to receipt_categories_path, notice: "カテゴリ「#{@receipt_category.name}」を登録しました"
    else
      flash[:alert] = @receipt_category.errors.full_messages.to_sentence
      redirect_to receipt_categories_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @receipt_category = ReceiptCategory.find(params['id'])
    if @receipt_category.destroy
      redirect_to receipt_categories_path, notice: "カテゴリ「#{@receipt_category.name}」を削除しました"
    else
      redirect_to receipt_categories_path, danger: "カテゴリ「#{@receipt_category.name}」を削除できませんでした"
    end
  end

  private

  def receipt_category_params
    params.require(:receipt_category).permit(:name, :description, :food_related, :user_group_id)
  end
end
