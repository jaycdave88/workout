class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
      @user = current_user if current_user
      @workouts = current_user.workouts
  end

  def show
    if current_user.id == @workout.user_id
      render :show
    else
      redirect_to root_path
    end
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id if current_user
    if @workout.save
      flash[:notice] = "Workout created successfully"
      redirect_to @workout
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :mood, :length)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end
end
