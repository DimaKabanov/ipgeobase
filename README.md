[![Ruby](https://github.com/DimaKabanov/ipgeobase/actions/workflows/main.yml/badge.svg)](https://github.com/DimaKabanov/ipgeobase/actions/workflows/main.yml)

# Ipgeobase

Simple utility that returns IP-address information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipgeobase'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipgeobase

## Usage

```ruby
ip_meta = Ipgeobase.lookup('8.8.8.8')
ip_meta.city # Ashburn
ip_meta.country # United States
ip_meta.countryCode # US
ip.lat # 39.03
ip.lon # -77.5
```