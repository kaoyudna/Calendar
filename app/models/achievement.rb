class Achievement < ApplicationRecord

  belongs_to :schedule
  belongs_to :user

  # 学習時間の合計を時間及び分単位で表示するメソッド
  def total_engraving_time
    total_time = self.total_time
    hours = total_time / 3600
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

  # 学習時間の合計を保存する
  def calculate_total_time
    start_time = self.start_time
    end_time = self.end_time
    total_time = (end_time - start_time).to_i
    self.update(total_time: total_time)
  end

end
