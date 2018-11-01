class AddressValidationService

  def initialize(params = {})
    @credit_card_number           = params[:credit_card_number]
    @recommended_list_price       = params[:recommended_list_price]
    @client_enthusiasm            = params[:update_client_enthusiasm]
    @buyer_agent_commission       = params[:buyer_agent_commission]
    @about_the_seller             = params[:about_the_seller]
    @credit_card_expiration_month = params[:date][:credit_card_expiration_month]
    @credit_card_expiration_year  = params[:date][:credit_card_expiration_year]
  end

  def valid_input?
    valid_credit_card? &&
    valid_list_price? &&
    valid_client_enthusiasm? &&
    valid_buyer_agent_commision? &&
    valid_seller_info? &&
    valid_credit_card_expiration_date?
  end

  def valid_credit_card?
    CreditCardValidations::Detector.new(@credit_card_number).valid?
  end

  def valid_list_price?
    (1..100000000).include?(@recommended_list_price.to_i)
  end

  def valid_client_enthusiasm?
    !is_nil_or_empty?(@client_enthusiasm)
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

  def valid_seller_info?
    !is_nil_or_empty?(@about_the_seller)
  end

  def valid_credit_card_expiration_date?
    !is_nil_or_empty?(@credit_card_expiration_month) && !is_nil_or_empty?(@credit_card_expiration_year)
  end

  private

    def is_nil_or_empty?(value)
      value.nil? || value.empty?
    end

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
end
