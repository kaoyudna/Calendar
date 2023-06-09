class AchievementsController < ApplicationController
  before_action :authenticate_user!

  def index
    # 学習合計時間の計算時にエラーが発生するためend_timeが保存されていないレコードは除外
    @achievements = current_user.achievements.all.where.not(end_time: nil)
  end

  def show
    @schedule = Schedule.find(params[:schedule_id])
  end

  def create
    # DateTime.nowにするとローカルな時間を取得してしまうためTime.zone.nowで東京の現在時刻を取得
    start_time = Time.zone.now
    @schedule = Schedule.find(params[:schedule_id])
    Achievement.create(start_time: start_time, schedule_id: @schedule.id, user_id: current_user.id)
  end

  def finish
    end_time = Time.zone.now
    @schedule = Schedule.find(params[:schedule_id])
    achievement = @schedule.achievement
    achievement.update(end_time: end_time)
    achievement.calculate_total_time
  end

  def edit
    @schedule = Schedule.find(params[:schedule_id])
    @achievement = @schedule.achievement
    # 遷移元のセッションを保存
    session[:previous_url] = request.referer
  end

  def update
    schedule = Schedule.find(params[:schedule_id])
    achievement = schedule.achievement
    achievement.update(achievement_params)
    achievement.calculate_total_time
    # editの1つ前のページへ遷移
    redirect_to session[:previous_url], notice: "学習履歴時間を変更しました"
  end


  private

  def achievement_params
    params.require(:achievement).permit(:start_time, :end_time)
  end

end
