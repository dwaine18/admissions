class ProgramsController < ApplicationController
 
  def index
    @programs = Program.all
  end


  def show
    @programs = Program.all
    @program = Program.find(params[:id]) 
  end

  def new
    @schools = School.all
    @program = Program.new
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
    end
   
  end

  def edit
    @schools = School.all
    
  end
  private
  def program_params
    params.require(:program).permit(:program_name, :description, :school_id)
  end
end
