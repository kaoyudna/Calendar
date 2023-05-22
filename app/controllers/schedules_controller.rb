class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def month
    @schedules = Schedule.where(user_id: current_user.id)
  end

  def week
    @schedules = Schedule.where(user_id: current_user.id)
  end

  def new
    @schedule = Schedule.new
    @default_date = params[:default_date].to_date
    # 遷移元のセッションを保存
    session[:previous_url] = request.referer
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save
      # newの1つ前のページへ遷移
      redirect_to session[:previous_url]
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    # 遷移元のセッションを保存
    session[:previous_url] = request.referer
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      # editの1つ前のページへ遷移
      redirect_to session[:previous_url]
    else
      render :new
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    # editの1つ前のページへ遷移
    redirect_to session[:previous_url]
  end


  private

  def schedule_params
    params.require(:schedule).permit(:title, :task, :remaining, :start_time, :end_time, :status)
  end

end
