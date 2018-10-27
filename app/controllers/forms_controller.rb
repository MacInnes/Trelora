class FormsController < ApplicationController

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
    else
      flash[:failure] = "Invalid form data."
      render :new
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
                    :credit_card_expiration_date)
    end
end
