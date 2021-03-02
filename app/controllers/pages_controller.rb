class PagesController < ApplicationController
  def contact
  end
  def adminDash
    #Finds the admin's information based on the user id. The user must be marked as admin to access this page.
    @adcom = Adcom.find_by(user_id: current_user.id)
  end
  def about
  end

  def dashboard
 
    @user = current_user
    #find the current student record based on logged in user.
    @student = Student.find_by(user_id: current_user.id)
    @student_apps = StudentApp.where(student_id: @student).all
  end

  def home 
    # Sign out action
    if current_user
    @adcom = Adcom.find_by(user_id: current_user.id)
    @student = Student.find_by(user_id: current_user.id)
    @student_apps = StudentApp.where(student_id: @student).all
    end
  end

  

  def blog
  end 

  def error
  end
end
