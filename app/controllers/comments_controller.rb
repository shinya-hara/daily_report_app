class CommentsController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @report.comments.create(comment_params)
    redirect_to report_path(@report)
  end

  def destroy
    @report = Report.find(params[:report_id])
    @comment = @report.comments.find(params[:id])
    @comment.destroy
    redirect_to report_path(@report)
  end


  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :report_id)
    end
end
