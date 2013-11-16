class CapsulesController < ApplicationController
  before_filter :get_course

	def new
  	@capsule = @course.capsules.new
  end

  def show
  	@capsule = @course.capsules.find(params[:id])
    @lectures = @capsule.lectures.order("created_at DESC")
    @problem_sets = @capsule.problem_sets.order("created_at DESC")
    @lectures.build
    @problem_sets.build
  end

  def create
  	@capsule = @course.capsules.new(capsule_params)
  	if @capsule.save
  		flash[:success] = "Capsule created!"
  		redirect_to [@course, @capsule]
  	else
  		render 'new'
    end
  end

  def destroy
  	@capsule = @capsule.find(params[:id])
  	@capsule.destroy
  	redirect_to :back
  end

private
  def capsule_params
    params.require(:capsule).permit(:name)
  end
end