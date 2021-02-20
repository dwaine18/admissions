class StudentAppsController < ApplicationController
    def index
        @student_app = StudentApp.all
    end
    
    def show
        @student_apps = StudentApp.all
        @student_app = StudentApp.find(params[:id])
      end
    
      def new
        puts "testing"
      end
    
      def edit
      end
end
