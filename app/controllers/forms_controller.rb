class FormsController < ApplicationController
  def new
    @listing = params[:address]
  end

  def create

  end
end
