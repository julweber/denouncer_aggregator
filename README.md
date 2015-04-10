# DenouncerAggregator

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'denouncer_aggregator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install denouncer_aggregator

## Configuration

The main configuration is read from environment variables. These are the available variables:
* PID_DIR - The pidfile directory (default: /tmp/) (optional)
* LOG_FILE - The logfile path (default: /tmp/denouncer_aggregator.log) (optional)
* LOG_LEVEL - The log level (default: 1 -> INFO) (0->Debug, 1->INFO, ...)

## Usage

You can start the daemon with the following command

    bundle exec bin/denouncer_aggregator start

You can stop the daemon using 

    bundle exec bin/denouncer_aggregator stop


## Contributing

1. Fork it ( https://github.com/[my-github-username]/denouncer_aggregator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
