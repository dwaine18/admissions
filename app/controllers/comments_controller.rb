class CommentsController < ApplicationController
    def new
        @comment = Comment.new
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
    @student_app = StudentApp.find(params[:id])
    @comments = Comment.all
    @student = Student.where(user_id: current_user.id).first
    @comment = Comment.create(comment_params)
        if @comment.save
        flash[:notice] = "Application successfully created."
        redirect_to student_app_path(@studentapp)
        else
        render '/student_apps/#{@program.id}/edit'
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
    params.require(:comment).permit(:comment, :student_app_id, :adcom_id)
end
end
