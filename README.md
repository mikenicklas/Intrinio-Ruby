# Intrinio-Ruby
This is a Ruby wrapper for the Intrinio API (http://intrinio.com)

"Welcome to the Intrinio API! We offer a wide selection of fundamental, financial, and price data for U.S. publicly traded companies. The primary application of the Intrinio API is for use in programtic application or for end-users utilizing the Excel Add-in."
[Read More](http://community.intrinio.com/docs/api/)

## Intrinio Documentation
Please register your application and view their documentation at http://community.intrinio.com/docs/api/

## Example Usage
Current functionality is limited but I am planning to add functionality for most of the important endpoints.
```ruby
a = Intrinio.new('<API USERNAME>', '<API PASSWORD>')

puts a.company('aapl')
{"ticker"=>"AAPL", "name"=>"Apple Inc ", "valuation_active"=>true, "legal_name"=>"Apple Inc.", "stock_exchange"=>"NASDAQ
", "sic"=>3571, "short_description"=>"Apple Inc. designs, manufactures, and markets mobile communication and media devic
es, personal computers, and portable digital music players worldwide.",...}

options = { query: {
              sort_order: 'desc', 
              start_date: '2015-07-01', 
              end_date: '2015-07-17'} }
puts a.price('aapl', options)
{"result_count"=>12, "page_size"=>100, "current_page"=>1, "total_pages"=>1, "data"=>[{"date"=>"2015-07-17", "open"=>129.
0, "high"=>129.53, "low"=>128.31, "close"=>129.3001, "volume"=>22387886.0, "ex_dividend"=>0.0, "split_ratio"=>1.0, "adj_
open"=>129.0, "adj_high"=>129.53, "adj_low"=>128.31, "adj_close"=>129.3001, "adj_volume"=>22387886.0},...}
```