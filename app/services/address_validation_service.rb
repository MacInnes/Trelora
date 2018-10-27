class AddressValidationService

  def initialize(params = {})
    @credit_card_number     = params[:credit_card_number]
    @recommended_list_price = params[:recommended_list_price]
    @client_enthusiasm      = params[:update_client_enthusiasm]
    @buyer_agent_commission = params[:buyer_agent_commission]
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

  def valid_buyer_agent_commision?
    sanitized = sanitize_currency(@buyer_agent_commission)
    converted = currency_converter(sanitized)
    if converted == 0
      false
    else
      converted.is_a?(Integer) || converted.is_a?(Float)
    end
  end
end

  private

    def sanitize_currency(number)
      number.gsub(/[$,%]/, '')
    end

    def currency_converter(number)
      if number.include?('.')
        number.to_f
      else
        number.to_i
      end
    end
