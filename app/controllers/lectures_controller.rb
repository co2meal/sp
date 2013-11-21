class LecturesController < InheritedResources::Base
  def show
    @course= Course.find(params[:course_id])
    super
  end
end
