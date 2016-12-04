class RoomManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room_management, only: [:show, :edit, :update, :destroy]

  # GET /room_managements
  # GET /room_managements.json
  def index
    @room_managements = RoomManagement.all.order("room_no")
  end

  # GET /room_managements/1
  # GET /room_managements/1.json
  def show
  end

  # GET /room_managements/new
  def new
    @room_management = RoomManagement.new
  end

  # GET /room_managements/1/edit
  def edit
  end

  # POST /room_managements
  # POST /room_managements.json
  def create
    @room_management = RoomManagement.new(room_management_params)
    @room_management.user = current_user
    respond_to do |format|
      if @room_management.save
        format.html { redirect_to @room_management, notice: 'Room management was successfully created.' }
        format.json { render :show, status: :created, location: @room_management }
      else
        format.html { render :new }
        format.json { render json: @room_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_managements/1
  # PATCH/PUT /room_managements/1.json
  def update
    @check = RoomManagement.find(params[:id])
    @room_management.user = current_user
    if params[:room_management][:status] == "Available" then
      puts params[:room_management][:arrival_date]
      @room_management.student_id = nil
      @room_management.arrival_date = nil
      if !@check.student_id.nil?
        @room_history = RoomHistory.new
        @room_history.category_no = params[:room_management][:category_no]
        @room_history.dorm = params[:room_management][:dorm]
        @room_history.student_id = @check.student_id
        @room_history.arrival_date = @check.arrival_date
        @room_history.leave_date = DateTime.civil(params[:room_management]["arrival_date(1i)"].to_f,params[:room_management]["arrival_date(2i)"].to_f,params[:room_management]["arrival_date(3i)"].to_f,params[:room_management]["arrival_date(4i)"].to_f,params[:room_management]["arrival_date(5i)"].to_f, 0, 0)
        @room_history.allocated_user_id = @check.user_id
        @room_history.deallocated_user_id = current_user.id
        @room_history.room_management = @check
        @room_history.save

        @room_management.status = "Available"
        params[:room_management].delete_if{ |key, value| key.match(/^arrival_date/) }
      end
    end
    respond_to do |format|
      if @room_management.update(room_management_params)
        format.html { redirect_to @room_management, notice: 'Room management was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_management }
      else
        format.html { render :edit }
        format.json { render json: @room_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_managements/1
  # DELETE /room_managements/1.json
  def destroy
    @room_management.destroy
    respond_to do |format|
      format.html { redirect_to room_managements_url, notice: 'Room management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_management
      @room_management = RoomManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_management_params
      @check = RoomManagement.find(params[:id])
      if params[:room_management][:status] == "Available" then
        if !@check.student_id.nil?
          params.require(:room_management).permit(:room_no, :category_no, :dorm, :arrival_date, :user_id)
        else
          params.require(:room_management).permit(:room_no, :category_no, :dorm, :status, :user_id)
        end
      else
        params.require(:room_management).permit(:room_no, :category_no, :dorm, :status, :student_id, :arrival_date, :user_id)
      end

    end
end
