class CompaniesController < ApplicationController
  before_action :is_admin
  def new
    @company = current_user.companies.new
  end

  def create
    @company = current_user.companies.create(company_params)
    redirect_to root_path
  end

  def edit
    @company = current_user.companies.find(params[:id])
  end

  def update
    @company = current_user.companies.find(params[:id])
    @company.update(company_params)
    flash[:notice] = "Company updated successfully"
    redirect_to root_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :address_1, :address_2, :city, :state, :zip, :phone_1, :phone_2)
  end

end
