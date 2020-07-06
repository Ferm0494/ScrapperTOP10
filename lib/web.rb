require 'nokogiri'
require 'open-uri'
class Web
  attr_reader :doc
  def initialize(url)
    @doc = Nokogiri::HTML(URI.open(url))
  end
end
