class StudentsController < ActionController::Base  
    def new
        @student = Student.new
    end 

    def create
        @student = Student.new(params.require(:student).permit(:first_name, :last_name))
        @student.save
        redirect_to student_path(@student) 
    end

    def show
        @student = Student.find_by(params[:id])
    end 

    def edit
        @student = Student.find(params[:id])
    end 

    def update
        @student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to student_path(@student) 
    end 

    private

  def student_params
    params.require(:student).permit!
  end
end
