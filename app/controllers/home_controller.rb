class HomeController < ApplicationController
  def index
  end

  def managehousingdetail
    @housing_details = HousingDetail.where(status: 'Waiting for Approval')
  end

  def public
    @housing_details = HousingDetail.where(status: 'Approved')
  end

  def btn_approve
    @housingdetail = Housingdetail.find(params[:id])
    @housingdetail.status = "Approved"
    @housingdetail.save
    redirect_to home_managehousingdetail_path
  end

  def btn_reject
    @housingdetail = Housingdetail.find(params[:id])
    @housingdetail.status = "Rejected"
    @housingdetail.save
    redirect_to home_managehousingdetail_path
  end

end
