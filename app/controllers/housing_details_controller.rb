class HousingDetailsController < ApplicationController
  before_action :set_housing_detail, only: [:show, :edit, :update, :destroy]

  # GET /housing_details
  # GET /housing_details.json
  def index
    @housing_details = HousingDetail.all
  end

  # GET /housing_details/1
  # GET /housing_details/1.json
  def show
  end

  # GET /housing_details/new
  def new
    @housing_detail = HousingDetail.new
  end

  # GET /housing_details/1/edit
  def edit
  end

  # POST /housing_details
  # POST /housing_details.json
  def create
    @housing_detail = HousingDetail.new(housing_detail_params)

    respond_to do |format|
      if @housing_detail.save
        format.html { redirect_to @housing_detail, notice: 'Housing detail was successfully created.' }
        format.json { render :show, status: :created, location: @housing_detail }
      else
        format.html { render :new }
        format.json { render json: @housing_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /housing_details/1
  # PATCH/PUT /housing_details/1.json
  def update
    respond_to do |format|
      if @housing_detail.update(housing_detail_params)
        format.html { redirect_to @housing_detail, notice: 'Housing detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @housing_detail }
      else
        format.html { render :edit }
        format.json { render json: @housing_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /housing_details/1
  # DELETE /housing_details/1.json
  def destroy
    @housing_detail.destroy
    respond_to do |format|
      format.html { redirect_to housing_details_url, notice: 'Housing detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing_detail
      @housing_detail = HousingDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_detail_params
      params.require(:housing_detail).permit(:version_id, :catgory_no, :status, :category_name, :dorm, :size, :air_con, :balcony, :bathroom, :kitchen, :furniture, :cleaning, :description, :rent, :attachment)
    end
end
