class ReceiptsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @receipt = Receipt.new(regist_date: Date.current)
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
