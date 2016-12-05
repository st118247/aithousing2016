class HomeController < ApplicationController
  def index
  end

  def managehousingdetail
    @housing_details = HousingDetail.where(status: 'Waiting for Approval')
  end

  def public
    @hd = HousingDetail.where(status: 'Approved').order(version_id: :desc)
    render :layout => "publicpage"
    #@cat_id_unique = @hd.distinct.pluck(:category_id)

    #@cat_id_unique.each do |c|
    #  if @hd.where(category_id: c.to_i, status: 'Approved').present?
    #    @housing_details_1 = @hd.where(category_id: c.last.to_i).first
    #  end
    #end
  end

  def btn_approve
    @housingdetail = HousingDetail.find(params[:id])
    @housingdetail.status = "Approved"
    @housingdetail.save
    redirect_to home_managehousingdetail_path
  end

  def btn_reject
    @housingdetail = HousingDetail.find(params[:id])
    @housingdetail.status = "Rejected"
    @housingdetail.save
    redirect_to home_managehousingdetail_path
  end

end
