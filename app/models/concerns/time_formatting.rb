module TimeFormatting
  extend ActiveSupport::Concern

  def format_time(total_time)
    # total_timeが9000の
    # hours = 9000 / 3600
    # hoursは計算上2.5となるが整数型のため小数点は切り捨て
    hours = total_time / 3600
    # minutes = 9000 % 3600 / 60
    # 合計時間/3600が時間の計算となるので余った数値を求めると分を計算できる
    # 今回は1800が余りの数値のため 1800/60 = 30(分)となる
    minutes = total_time % 3600 / 60
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