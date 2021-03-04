class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
    #Checks to see if the user is an admin, if admin, they are redirected to special dashboard.    
        if current_user.admin
            if !Adcom.find_by(user_id: current_user.id)
                "/adcoms/new"
            else
                     "/adminDash"
            end
        else
            if !Student.find_by(user_id: current_user.id)
                "/students/new"
            else
                "/dashboard"
            end
        end
    end
   
end
