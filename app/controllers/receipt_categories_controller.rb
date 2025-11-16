class ReceiptCategoriesController < ApplicationController
  def index
    @receipt_categories = ReceiptCategory.all
  end

  def show
    @receipt_category = ReceiptCategory.find(params['id'])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
