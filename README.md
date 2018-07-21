# pulsedive-rb

[![Build Status](https://travis-ci.org/ninoseki/pulsedive-rb.svg?branch=master)](https://travis-ci.org/ninoseki/pulsedive-rb)
[![Maintainability](https://api.codeclimate.com/v1/badges/35b08b3018cee65b42a0/maintainability)](https://codeclimate.com/github/ninoseki/pulsedive-rb/maintainability)

A Ruby library for [Pulsedive](https://pulsedive.com/) API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pulsedive'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pulsedive

## Usage

### As a Library

```rb
require 'pulsedive'

# When given nothing, it tries to load your Pulsedive API key from ENV["PULSEDIVE_API_KEY]
api = Pulsedive::API.new
# or you can pass your API key as an argument
api = Pulsedive::API.new(YOUR_API_KEY)

## Indicator(https://pulsedive.com/api/?q=indicators)
api.indicator.get_by_id(2);
# => {"iid"=>2,"type"=>"domain","indicator"=>"alvoportas.com.br","risk"=>"high", ...
api.indicator.get_by_value("pulsedive.com")
# => {"iid"=>53929,"type"=>"domain","indicator"=>"pulsedive.com","risk"=>"none", ...
api.indicator.get_links_by_id(2)
# => {"Active DNS"=>[{"iid"=>3,"indicator"=>"187.191.98.202","type"=>"ip","risk"=>"none", ...
api.indicator.get_properties_by_id(2)
# => {"dns"=>[{"pid"=>15302704,"stamp_seen"=>"2018-07-12 11:08:32","name"=>"A", ...

## Threat(https://pulsedive.com/api/?q=threats)
api.threat.get_by_id(1)
# => {"tid"=>1,"threat"=>"Zeus","category"=>"malware","risk"=>"high","description"=>"", ...
api.threat.get_by_name("Zeus")
# => {"tid"=>1,"threat"=>"Zeus","category"=>"malware","risk"=>"high","description"=>"", ...
api.threat.get_summary_by_id(1)
# => {"risk"=>{"critical"=>19,"unknown"=>24,"medium"=>47,"high"=>63,"low"=>71,"none"=>368}, ...
api.threat.get_linked_indicators_by_id(1)
# #=> {"page_current"=>0,"results"=>[{"iid"=>1,"indicator"=>"afobal.cl","type"=>"domain", ...

## Feeds(https://pulsedive.com/api/?q=feeds)
api.feed.get_by_id(1)
# => {"fid"=>1,"feed"=>"Zeus Bad Domains","category"=>"malware","organization"=>"abuse.ch", ...
api.feed.get_linked_indicators_by_id(1)
# => {"page_current"=>0,"results"=>[{"iid"=>1,"indicator"=>"afobal.cl","type"=>"domain", ...

## Analyze(https://pulsedive.com/api/?q=analyze)
api.analyze.add_to_queue("pulsedive.com")
# => {"success"=>"Added  to queue.","qid"=>11781524}'
api.analyze.get_results_by_id(11781524)
# => {"success"=>"Analyzed domain: pulsedive.com","data"=>{"iid"=>"53929","type"=>"domain", ...

## Search(https://pulsedive.com/api/?q=search)
params = {
  "search": "feed",
  "value": "zeus",
  "category": [
    "general", "abuse", "attack", "botnet", "crime", "fraud",
    "group", "malware", "proxy", "pup", "reconnaissance",
    "spam", "terrorism", "vulnerability"
  ],
  "splitrisk": "1"
}
api.search(params)
# => '{"results"=>[{"fid"=>1,"name"=>"Zeus Bad Domains","category"=>"malware", ...

```

### As a CLI

```bash
$ pulsedive
Commands:
  pulsedive analyze COMMAND    # analyze commands
  pulsedive feed COMMAND       # feed commands
  pulsedive help [COMMAND]     # Describe available commands or one specific command
  pulsedive indicator COMMAND  # indicator commands
  pulsedive threat COMMAND     # threat commands

$ pusledive analyze
Commands:
  pulsedive analyze add_to_queue [IOC]      # add ioc to the queue for analysis
  pulsedive analyze get_results_by_id [ID]  # get analyze result
  pulsedive analyze help [COMMAND]          # Describe subcommands or one specific subcommand

Options:
  [--API-KEY=API_KEY]

$ pulsedive feed
Commands:
  pulsedive feed get_by_id [ID]                    # get feed by id
  pulsedive feed get_linked_indicators_by_id [ID]  # get linked indicators by id
  pulsedive feed help [COMMAND]                    # Describe subcommands or one specific subcommand

Options:
  [--API-KEY=API_KEY]

$ pulsedive indicator
Commands:
  pulsedive indicator get_by_id [ID]             # get indicators by id
  pulsedive indicator get_by_value [VALUE]       # get indicators by value
  pulsedive indicator get_links_by_id [ID]       # get links by id
  pulsedive indicator get_properties_by_id [ID]  # get properties by id
  pulsedive indicator help [COMMAND]             # Describe subcommands or one specific subcommand

Options:
  [--API-KEY=API_KEY]

$ pulsedive threat
Commands:
  pulsedive threat get_by_id [ID]                    # get threat by id
  pulsedive threat get_by_name [NAME]                # get threat by name
  pulsedive threat get_linked_indicators_by_id [ID]  # get linked indicators by id
  pulsedive threat get_summary_by_id [ID]            # get summary by id
  pulsedive threat help [COMMAND]                    # Describe subcommands or one specific subcommand

Options:
  [--API-KEY=API_KEY]
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
