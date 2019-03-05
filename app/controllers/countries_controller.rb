class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
  end
end
