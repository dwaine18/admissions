class StudentAppsController < ApplicationController
    def index
        @student_apps = StudentApp.all
    end
    def dashboard
        byebug
        @student = Student.where(user_id: current_user.id).first
        
        @student_apps = StudentApp.where(student_id: @student)
    end
    def show
        @student_apps = StudentApp.all
        @student_app = StudentApp.find(params[:id])
       @student = Student.where(user_id: current_user.id)
      end
    
      def new
        @student = Student.where(user_id: current_user.id)
      end
      def create
        @schools = School.all
        @student = Student.where(user_id: current_user.id).first
        @studentapp = StudentApp.create(studentapp_params)
            if @studentapp.save
            flash[:notice] = "Application successfully created."
            redirect_to student_app_path(@studentapp)
            else
            render '/programs/#{@program.id}'
            end
      end
      def edit
      end
    private
    def studentapp_params
        params.require(:student_app).permit(:student_id, :program_id, :essay)
    end
end
