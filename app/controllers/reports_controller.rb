class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /reports
  # GET /reports.json
  def index
    @user = current_user || User.new
    # グループに所属していない場合
    if @user.group_id == 0 || @user.group_id.nil?
      @reports = Report.page(params[:page]).per(10).where(user_id: @user.id).includes(:user).order(date: :desc)
    # グループに所属している場合
    else
      user_ids = User.joins(:group).where('group_id = ?', @user.group_id).select(:id)
      @reports = Report.page(params[:page]).per(10).where(user_id: user_ids, private: false).includes(:user).order(date: :desc)
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @user = @report.user
    @reports = @user.reports.where(private: false).order(date: :desc).limit(5)
  end

  # GET /reports/new
  def new
    # reportの新規作成時は report.user_id: current_user.id, report.date: 現在の日付 をセット
    @report = Report.new(user_id: current_user.id, date: Time.current.strftime("%Y-%m-%d"))
  end

  # GET /reports/1/edit
  def edit
    if @report.user_id != current_user.id
      flash[:alert] = '他ユーザの日報は編集できません'
      redirect_to root_url
    end
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: '日報を作成しました' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: '日報を更新しました' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: '日報を削除しました' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:date, :content, :user_id, :private)
  end
end
