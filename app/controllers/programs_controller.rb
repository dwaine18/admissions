class ProgramsController < ApplicationController
  def show
    @programs = Program.all
  end

  def new
  end

  def edit
  end
end
