class ProgramsController < ApplicationController
  
  def index
    @programs = Program.all
  end


  def show
    
    @programs = Program.all
    @program = Program.find(params[:id]) 
    @student = Student.where(user_id: current_user.id).first
   
  end

  def new
    @schools = School.all
    @program = Program.new
    @studentapp = StudentApp.new
    @student = Student.where(user_id: current_user.id).first
  end

  def create
    
    @schools = School.all
    @program = Program.create(program_params)
    # See if program was created successfully, if not display error message and render form again
    if @program.save
      flash[:notice] = "Program successfully created."
      redirect_to program_path(@program)
    else
      render '/programs/new'
      # @studentapp = StudentApp.create(studentapp_params)
    end
    
    @student = Student.where(user_id: current_user.id).first
    @studentapp = StudentApp.create(studentapp_params)
    if @studentapp.save
      flash[:notice] = "Application successfully created."
      redirect_to studentapp_path(@studentapp)
    else
      render '/programs/#{@program.id}'
     end
  end

  def edit
    @schools = School.all
    
  end
  private
  def program_params
    params.require(:program).permit(:program_name, :description, :school_id)
  end

  def studentapp_params
    params.require(:student_app).permit(:student_id, :program_id, :essay)
  end
end
