class PicturesController < ApplicationController
  def create
    @student = Student.find(params[:student_id])
    @picture = @student.pictures.new
    @picture.image = params[:picture][:image]
    @picture.remote_image_url = params[:picture][:remote_image_url]
    @picture.save

    redirect_to @student
  end

  def destroy
    # !!!!!!!!!!
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
