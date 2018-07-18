class LessonsController < ApplicationController

    before_action :authenticate_student!
    before_action :check_lesson, only: [:new, :create]
	
    def new
        @instructor = instructor.find(params[:instructor_id])
        @lesson = @instructor.lessons.new
    end
    
    def create
        @instructor = instructor.find(params[:instructor_id])
        @lesson = @instructor.lessons.new(lesson_params)
        @lesson.save
        if lesson.check_instructor(@lesson)
            @lesson.destroy
           return redirect_to new_lesson_path(@instructor), notice: "The time slot is not available." 
        else
            redirect_to lessons_confirmation_path(@lesson), notice: "lesson Created"
        end
    end
    
    def destroy
       @lesson = lesson.find(params[:id])
       @lesson.destroy
       redirect_to instructors_dashboard_path, notice: "Your lesson was Canceled."
    end
    
    def confirmation
        @lesson = lesson.find(params[:id])
    end
    
    private
    
    def lesson_params
        params.require(:lesson).permit(:student_id,:lesson_date ,:lesson_time)
    end
end
