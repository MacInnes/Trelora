class FormsController < ApplicationController

  def new
    @listing = current_address
  end

  def create

  end
end
