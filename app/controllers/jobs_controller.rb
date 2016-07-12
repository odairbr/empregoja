class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new job_params

    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
    @companies = Company.all

    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :category, :company_id, :description,
                                :location, :featured)
  end

end
