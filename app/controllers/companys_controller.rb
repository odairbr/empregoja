class CompanysController < ApplicationController

  def show
    @companys = Company.all
  end
  
end
