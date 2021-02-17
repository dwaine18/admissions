class StudentAppsController < ApplicationController
    def show
        @student_apps = StudentApp.all
      end
    
      def new
        puts "testing"
      end
    
      def edit
      end
end
