class AdcomsController < ApplicationController
  
  def index
    @adcoms = Adcom.all
  end

  def show
    @adcom = Adcom.find(params[:id])
  end

  def new
  end

  def edit
  end
end
