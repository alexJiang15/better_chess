class ExercisesController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @exercise = Exercise.new
    @exercise.author_id = current_user.id
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.save
      flash[:success] = "exercise created"
      redirect_to @exercise
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
    @solution = current_user.solutions.build if signed_in?
  end
  
  def show
    @exercise = Exercise.find(params[:id])
  end
  
  def index
    @exercises = Exercise.order(:name).all
  end
  
  def destroy
    Exercise.find(params[:id]).destroy
    flash[:success] = 'exercise deleted'
    redirect_to exercises_path
  end
  
  private
  
  private
  
  def check_signed_in_user
    unless signed_in?
      flash[:warning] = 'please sign in first'
      redirect_to signin_url
    end
  end
  
end
