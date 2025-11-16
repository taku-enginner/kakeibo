class CalendarsController < ApplicationController
  def index
    # 1. 表示する基準日を設定 (URLパラメータがなければ今月) 2025-11-16
    @date = params[:date] ? Date.parse(params[:date]) : Date.current

    # 2. 今月の最初の日と最後の日を計算
    @start_date = @date.beginning_of_month.beginning_of_week(:sunday) #10-26
    @end_date = @date.end_of_month.end_of_week(:sunday)               #12-06

    # 3. 始まりから終わりまでの全日付の配列を作成
    @calendar_days = (@start_date..@end_date).to_a #10-26 ~ 12-06

    # 4. 週ごとの表示に役立つよう、日付を7日ずつの配列に分割
    @weeks = @calendar_days.each_slice(7).to_a

    get_joined_group_receipts_related_food
    get_joined_group_receipts_except_food
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

  private

  def get_joined_group_receipts_related_food
    joined_group_receipts_related_food = Receipt.joins(:receipt_category)
      .where(
      user_group_id: current_user.user_group.id,
      receipt_category: {food_related: true}
    )

    @calendar_price_related_food = {}
    @calendar_days.each do |day|
      sum = 0
      joined_group_receipts_related_food.each do |receipt|
        if day == receipt.regist_date
          sum += receipt.price
        end
      end
      @calendar_price_related_food[day] = sum
    end

    @weekly_price_related_food = []
    @weeks.each do |week|
      sum = 0
      week.each do |day|
        joined_group_receipts_related_food.each do |receipt|
          if day == receipt.regist_date
            sum += receipt.price
          end
        end
      end
      @weekly_price_related_food << sum
    end
  end

  def get_joined_group_receipts_except_food
    joined_group_receipts_except_food = Receipt.joins(:receipt_category)
      .where(
      user_group_id: current_user.user_group.id,
      receipt_category: {food_related: false}
    )

    @calendar_price_except_food = {}
    @calendar_days.each do |day|
      sum = 0
      joined_group_receipts_except_food.each do |receipt|
        if day == receipt.regist_date
          sum += receipt.price
        end
      end
      @calendar_price_except_food[day] = sum
    end

    @weekly_price_except_food = []
    @weeks.each do |week|
      sum = 0
      week.each do |day|
        joined_group_receipts_except_food.each do |receipt|
          if day == receipt.regist_date
            sum += receipt.price
          end
        end
      end
      @weekly_price_except_food << sum
    end
  end
end
