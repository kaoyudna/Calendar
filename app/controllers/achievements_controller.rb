class AchievementsController < ApplicationController

  def index
    @achievements = current_user.achievements.all.where.not(end_time: nil)
  end

  def show
    @schedule = Schedule.find(params[:schedule_id])
    # 遷移元のセッションを保存
    session[:previous_url] = request.referer
  end

  def create
    start_time = Time.zone.now
    @schedule = Schedule.find(params[:schedule_id])
    # schedule.achievement.create(start_time: start_time)だとエラーが発生する
    Achievement.create(start_time: start_time, schedule_id: @schedule.id, user_id: current_user.id)
  end

  def finish
    # Time.zone.nowにより東京の現在日時を取得
    end_time = Time.zone.now
    @schedule = Schedule.find(params[:schedule_id])
    achievement = @schedule.achievement
    @schedule.achievement.update(end_time: end_time)
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
