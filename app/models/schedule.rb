class Schedule < ApplicationRecord
  include TimeFormatting

  belongs_to :user
  has_one :achievement, dependent: :destroy

  validates :title, presence: true, length: { in: 1..50 }
  validates :task, length: { maximum: 50 }
  validates :remaining, length: { maximum: 50 }


  # 学習時間の合計を求めるメソッド
  def total_schedule_time(start_time, end_time)
    # 例 19:00:00 ~ 21:30:00まで計算を行う場合
    # diff = 21:30:00 - 19:00:00  結果: diff = 9000(整数型)
    diff = (end_time - start_time).to_i
    # hours = 9000 / 3600
    # hoursは計算上2.5となるが整数型のため小数点は切り捨て
    format_time(diff)
  end

end
