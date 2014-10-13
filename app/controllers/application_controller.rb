class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  skip_before_filter :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json' }

protected

  def configure_permitted_parameters

    # place permitted fields for registration here
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end

    # place permitted fields for editing here
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password)
    end

  end

  def get_course
    @course = Course.find(params[:course_id] || params[:id])
    unless @course.present?
      flash[:error] = "Invalid course!"
      redirect_to root_path
    else
      @capsules = @course.capsules
    end
  end

  def get_capsule
    @capsule = Capsule.find(params[:capsule_id] || params[:id])
    unless @capsule.present?
      flash[:error] = "Invalid capsule!"
      redirect_to root_path
    end
  end

  def get_capsules
    @capsules = @course.capsules.order("created_at DESC")
    @capsules.build
  end

  def get_lecture
    @lecture = Lecture.find(params[:lecture_id] || params[:id])
    unless @lecture.present?
      flash[:error] = "Invalid lecture!"
      redirect_to root_path
    end
  end

  def get_video
    @video = Video.find(params[:video_id] || params[:id])
    unless @video.present?
      flash[:error] = "Invalid lecture!"
      redirect_to root_path
    end
  end

  def get_topic
    @topic = Topic.find(params[:topic_id] || params[:id])
    unless @topic.present?
      flash[:error] = "Invalid topic!"
      redirect_to root_path
    end
  end

  def get_all_course_capsules
    @capsules = @course.capsules
  end

end
