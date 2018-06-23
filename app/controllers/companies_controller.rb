class CompaniesController < ApplicationController
  def new
    @company = current_user.companies.new
  end

  def create
    @company = current_user.companies.create(company_params)
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end

end
