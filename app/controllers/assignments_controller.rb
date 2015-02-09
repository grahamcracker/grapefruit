class AssignmentsController < ApplicationController

  layout "course"

  before_filter :authenticate_user!, :get_course, :hide_sidebar
  before_filter :get_assignment, only: [:edit, :show, :update, :destroy]

  def index
    @assignments = @course.assignments.order("updated_at DESC")
  end

  def new
    @assignment = @course.assignments.new
  end

  def edit
  end

  def show
    @submissions = @assignment.submissions.where(user_id: current_user.id).order("created_at DESC")
  end

  def create

    authorize! :manage, @course

    @assignment = @course.assignments.new(assignment_params)

    if @assignment.valid?
      @assignment.save
      process_multiple_documents(@assignment)
      send_assignment_email(@course, @assignment)
      flash[:success] = "The assignment was created!"
      redirect_to course_assignments_path(@course)
    else
      render 'new'
    end
  end

  def update

    authorize! :manage, @course

    if @assignment.update_attributes(assignment_params)
      process_multiple_documents(@assignment)
      flash[:success] = "Assignment saved!"
    end

    render 'edit'

  end

  def destroy
    authorize! :manage, @course
    @assignment.destroy
    flash[:success] = "Assignment deleted!"
    redirect_to course_assignments_path(@course)
  end

  private

  def assignment_params
    params.require(:assignment).permit(:name, :description, :assignment_type_id, :points, :documents)
  end

  def send_assignment_email(course, assignment)
    if(params[:send_email])
      UserMailer.new_assignment(course, assignment).deliver_now
    end
  end

end
