class AchievementsController < ApplicationController

  def create
    start_time = DateTime.now
    schedule = Schedule.find(params[:schedule_id])
    # schedule.achievement.create(start_time: start_time)だとエラーが発生する
    Achievement.create(start_time: start_time, schedule_id: schedule.id)
    redirect_to edit_schedule_path(schedule)
  end

  def finish
    end_time = DateTime.now
    schedule = Schedule.find(params[:schedule_id])
    schedule.achievement.update(end_time: end_time)
    redirect_to edit_schedule_path(schedule)
  end

  def update
    schedule = Schedule.find(params[:schedule_id])
    schedule.achievement.update!(achievement_params)
    redirect_to edit_schedule_path(schedule)
  end


  private

  def achievement_params
    params.require(:achievement).permit(:start_time, :end_time)
  end

end
