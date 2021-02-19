class StudentsController < ApplicationController
  def index
    @students = Student.all
    # erb :'students/index'
  end
  #after log in redirect student to dashboard page
def dashboard
 
  @user = current_user
  #find the current student record based on logged in user.
  @student = Student.find_by(user_id: current_user.id)
end

def show
  @student = Student.find(params[:id])
  #finding the applications submitted by the current user.
  # session[:user_id] = @student.id
  
  
  
  # erb :'students/show'
end
  
 
  def new
  end

  def edit
  end
end
