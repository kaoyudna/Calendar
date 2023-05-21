class SchedulesController < ApplicationController

  def month
    @schedules = Schedule.all
  end

  def week
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @default_date = params[:default_date].to_date
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save!
      redirect_to month_schedules_path
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to month_schedules_path
    else
      render :new
    end
  end

  def destroy
  end


  private

  def schedule_params
    params.require(:schedule).permit(:title, :task, :remaining, :start_time, :end_time, :status)
  end

end
