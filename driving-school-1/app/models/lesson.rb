class Lesson < ActiveRecord::Base
  
    belongs_to :instructor
    belongs_to :student
    
    
    def self.check_instructor(lesson)
        @instructor = lesson.user
        @instructor.lessons.each do |appoint|
            if appoint.id != lesson.id
                if (appoint.lesson_date == lesson.lesson_date)
                    if ((lesson.lesson_time + 1.hour) > appoint.lesson_time) and ((appoint.lesson_time + 1.hour) > lesson.lesson_time)
                        return true
                    end
                end
            end
        end
        return false
    end
    
end