class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @user = current_user || User.new
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @user = current_user || User.new
  end

  # GET /groups/new
  def new
    @group = Group.new(user_id: current_user.id)
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'グループを作成しました' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'グループを更新しました' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'グループを削除しました' }
      format.json { head :no_content }
    end
  end

  def set
    group = Group.find(params[:group][:group_id])
    if group && group.authenticate(params[:group][:password])
      # パスワードが正しい場合（グループ参加）
      current_user.update(user_params)  # ユーザの所属グループ（group_id）を変更する
      flash[:notice] = "所属グループを変更しました"
      redirect_to root_url
    else
      redirect_to group_url(params[:group][:group_id]), alert: 'パスワードが一致しません'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :password, :password_confirmation, :description, :user_id)
    end

    def user_params
      params.require(:group).permit(:group_id)
    end
end
