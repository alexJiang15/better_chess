class ExercisesController < ApplicationController
  def new
    @exercise = Exercise.new
  end
  
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      flash[:success] = "exercise created"
      redirect_to exercises_path
    else
      render 'new'
    end
  end
  
  def edit
    @exercise = Exercise.find(params[:id])
  end
  
  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(exercise_params)
      flash[:success] = 'exercise updated'
      redirect_to exercises_path
    else
      render 'edit'
    end
  end
  
  def solve
    @exercise = Exercise.find(params[:id])
  end
  
  def show
    @exercise = Exercise.find(params[:id])
  end
  
  def index
    @exercises = Exercise.all.order(:name)
  end
  
  def destroy
    Exercise.find(params[:id]).destroy
    flash[:success] = 'exercise deleted'
    redirect_to exercises_path
  end
  
  private
  
  def exercise_params
    params.require(:exercise).permit(:name, :fen_position, :difficulty, :score, :last_logged_in)
  end
  
end
