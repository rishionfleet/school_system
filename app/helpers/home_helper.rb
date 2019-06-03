module HomeHelper

  def student_count
    Student.count
  end

  def teacher_count
    Teacher.count
  end
  
  def subject_count
    Subject.count
  end

end
