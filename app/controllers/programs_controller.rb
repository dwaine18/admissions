class ProgramsController < ApplicationController
 
  def index
    @programs = Program.all
  end


  def show
    @programs = Program.all
    @program = Program.find(params[:id]) 
  end

  def new
  end

  def edit
  end
end
