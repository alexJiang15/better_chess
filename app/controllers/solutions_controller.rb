class SolutionsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  
  def new 
    @exercise = Exercise.find(params[:exercise_id])
    @user = current_user
    @solution = Solution.new
  end
  
  def create
    @exercise = Exercise.find(params[:solution][:exercise_id])
    @solution = Solution.new(params[:solution])
    if @solution.save
      flash[:success] = 'solution saved'
      redirect_to @solution
    else
      @feed_items = []
      render 'new'
    end
  end
  
  def show
    @solution = Solution.find(params[:id])
  end
  
  def index
    @solutions = Solution.paginate(page: params[:page])
  end
  
  def destroy
    @solution.destroy
    flash[:success] = 'solution deleted'
    redirect_back_or(solutions_path)
  end
  
  private
  
  def correct_user
    @solution = current_user.solutions.find_by_id(params[:id])
    redirect_to root_path if @solution.nil?
  end
end
