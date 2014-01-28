require 'brcep'

class AddressSearcher

  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def search
    parse_response.to_json
  end

  private

  def result
    @result ||= BuscaEndereco.cep(zipcode)
  end

  def parse_response
    begin
      valid_json
    rescue RuntimeError => e
      invalid_json(e)
    end
  end

  def valid_json
    {
      street_address: "#{result[:tipo_logradouro]} #{result[:logradouro]}",
      neighborhood: result[:bairro],
      city: result[:cidade],
      state: result[:uf]
    }
  end

  def invalid_json(e)
    {
      error: e.message
    }
  end
end
