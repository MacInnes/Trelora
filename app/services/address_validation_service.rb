class AddressValidationService

  def initialize(params = {})
    @credit_card_number     = params[:credit_card_number]
    @recommended_list_price = params[:recommended_list_price]
    @client_enthusiasm      = params[:update_client_enthusiasm]
  end

  def valid_credit_card?
    CreditCardValidations::Detector.new(@credit_card_number).valid?
  end

  def valid_list_price?
    (1..100000000).include?(@recommended_list_price.to_i)
  end

  def valid_client_enthusiasm?
    !@client_enthusiasm.nil?
  end
end
