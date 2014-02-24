class SolutionsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  
  def create
    @solution = current_user.solutions.build(params[:solution])
    if @solution.save
      flash[:success] = 'solution saved'
      redirect_to @solution
    else
      render 'new'
    end
  end
  
  def show
    @solution = Solution.find(params[:id])
  end
  
  def index
    @solutions = Solution.order(:exercise_id).all
  end
  
  def destroy
    @solution.destroy
    flash[:success] = 'solution deleted'
    redirect_to solutions_path
  end
  
  private
  
  def correct_user
    @solution = current_user.solutions.find_by_id(params[:id])
    redirect_to root_path if @solution.nil?
  end
end
