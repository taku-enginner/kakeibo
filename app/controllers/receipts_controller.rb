class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def index
    @receipts = Receipt.all
    puts "******"
    # 自分の所属グループの食費系のレシートを取得
    @hoge = Receipt.joins(:receipt_category)
      .where(
      user_group_id: current_user.user_group.id,
      receipt_category: {food_related: true}
    )
    daily_total = @hoge.map{|hash| hash[:price] }.sum
    puts daily_total

    @hoge.each do |tmp|
      puts tmp.regist_date
    end
    # 日付ごとに計算できていない。日付ごとに計算する。
    puts "******"
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
