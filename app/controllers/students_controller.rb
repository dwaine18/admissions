class StudentsController < ApplicationController
  def index
    @students = Student.all
    # erb :'students/index'
  end
  #after log in redirect student to dashboard page
def dashboard
 
  @user = current_user
  #find the current student record based on logged in user.
  @student = Student.where(user_id: current_user.id).first
  @student_apps = StudentApp.where(student_id: @student).all
end

def show
  @student = Student.find(params[:id])
  #finding the applications submitted by the current user.
  # session[:user_id] = @student.id
  @student_apps = StudentApp.where(student_id: @student)
  
  
  # erb :'students/show'
end
  
 
  def new
    @studentuser = Student.where(user_id: current_user.id)
    if @studentuser
      render 'pages/noaccess'
    else
    @email = current_user.email
    @student = Program.new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    
    @student = Student.create(student_params)
    # See if student was created successfully, if not display error message and render form again
    if @student.save
      flash[:notice] = "Student successfully created."
      redirect_to student_path(@student)
    else
      #Set error messages to a sessions hash and display on redirected page - new student signup
      flash[:error] = @student.errors.full_messages
      flash[:error]
      flash.keep
      redirect_to '/students/new'
      
    end
   

  end

  

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Student successfully updated."
      redirect_to student_path(@student)
    else
      flash[:error] = @student.errors.full_messages
      flash[:error]
      flash.keep
      redirect_to '/students/edit'
    end
  end
  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :sat_score, :user_id)
  end
end
