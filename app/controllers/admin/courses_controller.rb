class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!, :check_admin
  
  def new
    @course = Course.new
    @question = @course.questions.build
    4.times{@option = @question.options.build}
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:notice] = "Make new course success!"
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find params[:id]
  end
  
  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:notice]= "updated!"
      redirect_to admin_courses_path
    else
      render :edit
      flash[:alert] = "update fail!"
    end
  end

  def index
    @courses = Course.all
  end
  
  def show
    @course = Course.find params[:id]
  end

  def destroy
    @course = Course.find(params[:id]).destroy
    redirect_to admin_courses_path
  end

  private
  def course_params
    params.require(:course).permit :name, :time,
     questions_attributes: [:_destroy, :content,
     options_attributes: [:_destroy, :content, :question_id, :correct]]
  end
end
