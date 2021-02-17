class StudentsController < ApplicationController
  def index
    @students = Student.all
    erb :'students/index'
  end

def show
  @student = Student.find(params[:id])
  #finding the applications submitted by the current user.
  # session[:user_id] = @student.id
  
  
  
  erb :'students/show'
end
  
  def show
    @students = Student.all
  end

  def new
  end

  def edit
  end
end
