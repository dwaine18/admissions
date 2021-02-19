class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end
  end
  def new
  end

  def show
    @schools = School.find(params[:id])
  end

  def edit
  end
end
