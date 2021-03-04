class AdcomsController < ApplicationController
  
  def index
    @adcoms = Adcom.all
  end

  def show
    @adcom = Adcom.find(params[:id])
    @studentapps = StudentApp.all
  end

  def new
    @adcom = Adcom.new
    @schools = School.all
    # Show only users who have admin authority
    @users = User.where(admin: true)
  end

  # Checks to see if user that is submitted has admin rights

  # def is_admin
  #   respond_to do |format|
  #   end
  # end
   def edit
     @adcom = Adcom.find(params[:id])
     @schools = School.all
   end
  def create
    @schools = School.all
    @users = User.where(admin: true)
    # @user = adcom.user.id
    @adcom = Adcom.create(adcom_params)
  
    if @adcom.save
      flash[:notice] = "Admissions Counselor has been successfully saved."
      redirect_to adcom_path(@adcom)
    else
      render "/adcoms/new"
    end
   end

  def update
    
      @adcom = Adcom.find(params[:id])
      @schools = School.all
      if @adcom.update(adcom_params)
        flash[:notice] = "Admissions Counselor successfully updated."
        redirect_to adcom_path(@adcom)
      else
        flash[:error] = @adcom.errors.full_messages
        flash[:error]
        flash.keep
        redirect_to '/adcoms/#{@adcom.id}/edit'
      
    end
  end

  private

  def adcom_params
    params.require(:adcom).permit(:first_name, :last_name, :user_id, :school_id)
  end
  def user_params
    params.require(:user).permit(:adcom)
  end
end
