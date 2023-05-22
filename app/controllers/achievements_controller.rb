class AchievementsController < ApplicationController

  def create
    start_time = DateTime.now
    schedule = Schedule.find(params[:schedule_id])
    schedule.achievements.create(start_time: start_time)
  end

  def update
    end_time =　DateTime.now
    achievement = Achievement.find_by(params[:schedule_id])
    achievement.update(end_time: end_time)
  end

end
