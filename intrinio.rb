require 'httparty'

class Intrinio
  include HTTParty
  base_uri 'https://www.intrinio.com/api/'
  
  def initialize(username, password)
    @auth = { username: username, password: password }
  end
  
  def companies(options = {})
    merge_auth(options)
    self.class.get('/companies', options)
  end
  
  def company(ticker, options = {})
    merge_auth(options)
    self.class.get("/companies?ticker=#{ticker.upcase}", options)
  end
  
  def price(ticker, options = {})
    merge_auth(options)
    self.class.get("/prices?ticker=#{ticker.upcase}", options)
  end
  
  def merge_auth(options)
    # merge authenticatation parameters to each call
    options.merge!(basic_auth: @auth)
  end
end