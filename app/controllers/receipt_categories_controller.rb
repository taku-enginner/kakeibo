class ReceiptCategoriesController < ApplicationController
  def index
    @receipt_categories = ReceiptCategory.all
    @receipt_category = ReceiptCategory.new
  end

  def show
    @receipt_category = ReceiptCategory.find(params['id'])
  end

  def new
    @receipt_category = ReceiptCategory.new
  end

  def create
    @receipt_category = ReceiptCategory.new(receipt_category_params)
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
    puts params
    @receipt_category = ReceiptCategory.find(params['id'])
    if @receipt_category.destroy
      redirect_to receipt_categories_path, notice: "カテゴリ「#{@receipt_category.name}」を削除しました"
    else
      redirect_to receipt_categories_path, danger: "カテゴリ「#{@receipt_category.name}」を削除できませんでした"
    end
  end

  private

  def receipt_category_params
    params.require(:receipt_category).permit(:name, :description, :food_related)
  end
end
