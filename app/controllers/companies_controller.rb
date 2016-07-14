class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params

    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])

  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
    else
      @company = Company.find(params[:id])
      render 'edit'
    end
  end


  private
  def company_params
    params.require(:company).permit(:name,
                                    :mail,
                                    :phone,
                                    :location)
  end

end
