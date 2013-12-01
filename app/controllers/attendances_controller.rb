class AttendancesController < InheritedResources::Base
  def new
    @course= Course.find(params[:course_id])
    @lecture = Lecture.find(params[:lecture_id])
    super
  end

  def create
    tempfile = Tempfile.new("photoupload")
    tempfile.binmode
    tempfile << request.body.read
    tempfile.rewind
    photo_params = params.slice(:filename, :type, :head).merge(:tempfile => tempfile)
    photo = ActionDispatch::Http::UploadedFile.new(photo_params)

    params[:picture] = params[:attendance].delete(:picture)
    @course= Course.find(params[:course_id])
    @lecture = @course.current_lecture

    unless @lecture
      respond_to do |format|
        format.json { render json: {error: "No current lecture error"}, status: :unprocessable_entity }
      end
      return
    end



    @attendance = @lecture.attendances.new(params[:attendance])
    @attendance.student = Student.find_by_sin(params[:attendance][:student_id])

    unless @attendance.student
      respond_to do |format|
        format.json { render json: {error: "No student error"}, status: :unprocessable_entity }
      end
      return
    end

    @attendance.build_picture
    # @attendance.picture.image = params[:picture][:image]
    @attendance.picture.image = photo
    #@attendance.picture.save!

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
