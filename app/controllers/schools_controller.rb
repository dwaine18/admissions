class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end
  
  def new
  end

  def show
    @school = School.find(params[:id])
    @programs = Program.where(school_id: @school.id)

  end

  def edit
  end

  def create
    
  end
end
