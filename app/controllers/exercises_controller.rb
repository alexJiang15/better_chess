class ExercisesController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @exercise = Exercise.new
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.author = current_user
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
    if @exercise.update_attributes(params[:exercise])
      flash[:success] = 'exercise updated'
      redirect_to exercises_path
    else
      render 'edit'
    end
  end
  
  def show
    @exercise = Exercise.find(params[:id])
    @solutions = @exercise.solutions
  end
  
  def index
    @exercises = Exercise.paginate(page: params[:page])
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
