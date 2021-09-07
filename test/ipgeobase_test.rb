# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/ipgeobase'

def get_fixture_path(name)
  File.join(__dir__, 'fixtures', name)
end

class IpgeobaseTest < Minitest::Test
  def test_correct_metadata
    xml_path = get_fixture_path('address.xml')
    xml = File.read(xml_path)

    stub_request(:get, 'http://ip-api.com/xml/24.48.0.1')
      .to_return(status: 200, body: xml)

    actual_ip_meta = Ipgeobase.lookup('24.48.0.1')

    expected_ip_meta = {
      'country' => 'Russia',
      'city' => 'Yekaterinburg',
      'countryCode' => 'RU',
      'lat' => '56.8333',
      'lon' => '60.6'
    }

    expected_ip_meta.each do |key, value|

    end
  end
end
