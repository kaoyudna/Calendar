class Schedule < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  # 学習時間の合計を求めるメソッド
  def total_schedule_time(start_time, end_time)
    # 例 19:00:00 ~ 21:30:00まで計算を行う場合
    # diff = 21:30:00 - 19:00:00  結果: diff = 9000(整数型)
    diff = (end_time - start_time).to_i
    # hours = 9000 / 3600
    # hoursは計算上2.5となるが整数型のため小数点は切り捨て
    hours = diff / 3600
    # minutes = 9000 % 3600 / 60
    # 合計時間/3600が時間の計算となるので余った数値を求めると分を計算できる
    # 今回は1800が余りの数値のため 1800/60 = 30(分)となる
    minutes = diff % 3600 / 60
    if hours > 0 && minutes > 0
      "#{hours}時間#{minutes}分"
    elsif hours > 0
      "#{hours}時間"
    elsif minutes > 0
      "#{minutes}分"
    else
      "0分"
    end
  end
end
