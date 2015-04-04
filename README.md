# feedcellar-web

[![Gem Version](https://badge.fury.io/rb/feedcellar-web.svg)](http://badge.fury.io/rb/feedcellar-web)

Feedcellar::Web is a Web interface for Feedcellar that is full-text searchable RSS feed reader and data store.

Powered by [Feedcellar][] and [Groonga][] (via [Rroonga][]) with [Ruby][].

[Feedcellar]:http://myokoym.net/feedcellar/
[Groonga]:http://groonga.org/
[Rroonga]:http://ranguba.org/#about-rroonga
[Ruby]:https://www.ruby-lang.org/

## Installation

    $ gem install feedcellar-web

## Usage

### Show help

    $ feedcellar-web

### Show feeds in a web browser

    $ feedcellar-web start [--silent]

Or

    $ rackup

#### Enable cache (using Racknga)

    $ FEEDCELLAR_ENABLE_CACHE=true rackup

## License

Copyright (c) 2013-2015 Masafumi Yokoyama `<myokoym@gmail.com>`

LGPLv2.1 or later.

See 'LICENSE.txt' or 'http://www.gnu.org/licenses/lgpl-2.1' for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
