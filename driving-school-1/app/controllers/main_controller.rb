class MainController < ApplicationController
    def index
        @instructors = Instructor.all
    end
    
    def instructor
       @instructors = Instructor.all
    end
	
	def instructor_dashboard
        
    end
    
    def student_dashboard
        
    end
    

end
