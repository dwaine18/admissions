class PagesController < ApplicationController
  def contact
  end
  def adminDash
    #Finds the admin's information based on the user id. The user must be marked as admin to access this page.
    @adcom = Adcom.find_by(user_id: current_user.id)
  end
  def about
  end

  def  dashboard
    @student = Student.find_by(user_id: current_user.id)
  end

  def home 
    # Sign out action
    if current_user
    @adcom = Adcom.find_by(user_id: current_user.id)
    @student = Student.find_by(user_id: current_user.id)
    end
  end

  def blog
  end 

  def error
  end
end
