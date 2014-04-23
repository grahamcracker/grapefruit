class CoursesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_course, only: [:show, :edit, :update, :destroy, :webwork, :iframe]
  before_filter :get_capsules, only: [:show, :edit, :update, :destroy, :webwork]

  layout :get_layout

  def new
    @course = Course.new
  end

  def create
    @course = current_user.instructed_courses.build(course_params)
    if @course.save
      flash[:success] = "Course created!"
      redirect_to @course
    else
      render 'new'
    end
  end

  def index
    @courses = Course.all
    @instructed_courses = current_user.instructed_courses
    @enrolled_courses = current_user.student_courses
  end

  def show
    @documents = @course.documents

    @course_user = @course.course_user(current_user)
    unless @course_user.present?
      @course_user = CourseUser.new
    end

    @topics = @course.topics.paginate(page: 1, per_page: 5)
  end

  def edit
    authorize! :update, @course
  end

  def update
    authorize! :update, @course
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated!"
      redirect_to course_path(@course)
    else
      render "edit"
    end
  end

  def destroy
    authorize! :destroy, @course
    @course.destroy
    redirect_to :back
  end

  def webwork
    redirect_to root_path unless @course.webwork_url.present?
  end

  def iframe
    redirect_to root_path unless @course.webwork_url.present?
    @course.ensure_webwork_exists(current_user)
    @url = @course.webwork_url
  end

private

  def course_params
    params.require(:course).permit(:name, :description, :subject, :course_number,
                                   :course_registration_number, :semester, :year,
                                   :spots_available, :credits, :webwork_url)
  end

  def get_layout
    case action_name
    when "new", "create", "index"
      "home"
    when "iframe"
      "lofi"
    else
      "course"
    end
  end

  def get_capsules
    @capsules = @course.capsules.order("created_at DESC")
    @capsules.build
  end

end
