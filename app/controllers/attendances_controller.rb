class AttendancesController < InheritedResources::Base
  def new
    @course= Course.find(params[:course_id])
    @lecture = Lecture.find(params[:lecture_id])
    super
  end

  def create
    params[:picture] = params[:attendance].delete(:picture)
    @course= Course.find(params[:course_id])
    @lecture = Lecture.find(params[:lecture_id])
    @attendance = @lecture.attendances.new(params[:attendance])
    @attendance.build_picture
    @attendance.picture.image = params[:picture][:image]

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to [@course, @lecture], notice: 'Attendnace was successfully created.' }
        format.json { render json: @attendance, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end
end
