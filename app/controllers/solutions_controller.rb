class SolutionsController < ApplicationController
  def new
    @solution = Solution.new
  end
  
  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      flash[:success] = 'solution saved'
    else
      render 'new'
    end
  end
  
  def show
    @solution = Solution.find(params[:id])
  end
  
  def index
    @solutions = Solution.all.order(:exercise_id)
  end
  
  def destroy
    Solution.find(params[:id]).destroy
    flash[:success] = 'solution deleted'
    redirect_to solutions_path
  end
  
  private
  
  def solution_params
    params.require(:solution).permit(:move_string, :score, :solver_id, :exercise_id)
  end
end
