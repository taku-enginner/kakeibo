class DailyResultsController < ApplicationController
  def index
  end

  def show
    puts params['id']
    # 自分の所属グループの食費系のレシートを取得
    @receipts = Receipt.joins(:receipt_category)
      .where(
      user_group_id: current_user.user_group.id,
      regist_date: params['id']
    )
  end
end
