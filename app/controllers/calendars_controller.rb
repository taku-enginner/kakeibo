class CalendarsController < ApplicationController
  def index
    # 1. 表示する基準日を設定 (URLパラメータがなければ今月)
    @date = params[:date] ? Date.parse(params[:date]) : Date.current

    # 2. 今月の最初の日と最後の日を計算
    @start_date = @date.beginning_of_month.beginning_of_week(:sunday)
    @end_date = @date.end_of_month.end_of_week(:sunday)

    # 3. 始まりから終わりまでの全日付の配列を作成
    @calendar_days = (@start_date..@end_date).to_a

    # 4. 週ごとの表示に役立つよう、日付を7日ずつの配列に分割
    @weeks = @calendar_days.each_slice(7).to_a

    # 食費の合計
    # ハッシュで持っておくのが良さそう
    @receipt = Receipt.where("user_id = ?", current_user.id)
    # グループの集計結果を出したいから、レシートはグループidに紐づけるべき？


    #
    # 食費以外の合計
  end

  def show
  end
end
