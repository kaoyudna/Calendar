class Achievement < ApplicationRecord
  include TimeFormatting

  belongs_to :schedule
  belongs_to :user

  # 学習時間の合計を時間及び分単位で表示するメソッド
  def total_engraving_time
    total_time = self.total_time
    format_time(total_time)
  end

  # 学習時間の合計を保存する
  def calculate_total_time
    start_time = self.start_time
    end_time = self.end_time
    total_time = (end_time - start_time).to_i
    self.update(total_time: total_time)
  end

end
