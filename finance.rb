require 'httparty'

class Finance
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
    options.merge!(basic_auth: @auth)
  end
end

### USAGE EXAMPLES ###
# a = Finance.new
# a.company('aapl')
# puts a.price('aapl', {query: {sort_order: 'desc', start_date: '2012-01-01', end_date: '2012-12-31'}})