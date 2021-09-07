# frozen_string_literal: true

require_relative 'ipgeobase/version'
require 'net/http'
require 'uri'
require 'happymapper'

module Ipgeobase
  def self.lookup(ip)
    xml_uri = URI("http://ip-api.com/xml/#{ip}")
    xml = Net::HTTP.get(xml_uri)
    HappyMapper.parse(xml)
  end
end
