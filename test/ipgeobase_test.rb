# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/ipgeobase'

def get_fixture_path(name)
  File.join(__dir__, 'fixtures', name)
end

class IpgeobaseTest < Minitest::Test
  def setup
    ip = '24.48.0.1'
    xml_path = get_fixture_path('address.xml')
    xml = File.read(xml_path)

    stub_request(:get, "http://ip-api.com/xml/#{ip}")
      .to_return(status: 200, body: xml)

    @ip_meta = Ipgeobase.lookup(ip)
  end

  def test_country
    assert_equal @ip_meta.country, 'Russia'
  end

  def test_city
    assert_equal @ip_meta.city, 'Yekaterinburg'
  end

  def test_country_code
    assert_equal @ip_meta.country_code, 'RU'
  end

  def test_lat
    assert_equal @ip_meta.lat, '56.8333'
  end

  def test_lon
    assert_equal @ip_meta.lon, '60.6'
  end
end
