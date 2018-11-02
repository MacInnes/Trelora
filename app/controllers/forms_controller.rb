class FormsController < ApplicationController
  before_action :logged_in?
  before_action :confirm_address_exists

  def new
    @listing = current_address
  end

  def create
    avs = AddressValidationService.new(address_params)
    if avs.valid_input?
      TreloraService.new.post_form(current_user.email,
                                   current_user.HTTP_AUTH_TOKEN,
                                   session[:address],
                                   address_params)
      # render :new
    else
      flash.now[:failure] = "Invalid form data, please verify and try again."
      render :new, status: 400
    end
  end

  private

  def address_params
    params.permit(:about_the_home,
                  :recommended_list_price,
                  :update_client_enthusiasm,
                  :buyer_agent_commission,
                  :about_the_seller,
                  :credit_card_number,
                  date:
                    %i[credit_card_expiration_month
                       credit_card_expiration_year])
  end
end
