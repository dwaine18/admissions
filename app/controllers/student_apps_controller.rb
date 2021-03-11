class StudentAppsController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

    def index
        @student_apps = StudentApp.all
    end
    def dashboard
        
        @student = Student.where(user_id: current_user.id).first
        
        @student_apps = StudentApp.where(student_id: @student)
    end
    def show
        @adcom = Adcom.where(user_id: current_user.id).first
        @student_apps = StudentApp.all
        @student_app = StudentApp.find(params[:id])
       @student = Student.where(user_id: current_user.id)
      end
    
      def new
        @student = Student.where(user_id: current_user.id)
        @studentapp = StudentApp.new
        @studentapp.build_comment
      end
      def edit
          @adcom = Adcom.where(user_id: current_user.id).first
          @student_apps = StudentApp.all
          @student_app = StudentApp.find(params[:id])
          @student = Student.where(user_id: current_user.id)
          @program = StudentApp.find(params[:id])
          @programs = Program.all
          @schools = School.all
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
      def update
        @adcom = Adcom.where(user_id: current_user.id).first

        @program = StudentApp.find(params[:id])
        @studentapp = StudentApp.update(studentapp_params)
    if @studentapp
      flash[:notice] = "Application successfully updated"
      redirect_to student_app_path(@studentapp)
    else
      render '/student_apps/#{@program.id}/edit'
     end
  end
    
    private
    def studentapp_params
        params.require(:student_app).permit( :student_id, :program_id, :essay, :score1, :score2,
        comment_attributes: [  :student_app_id, :adcom_id, :comment]
        )
    end
end
