# River

River renders JSON to a stream using the batch iteration

## Installation

Add this line to your application's Gemfile:

    gem 'river'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install river

## Usage

    class HomeController < ApplicationController
      def stream
        stream_json_in_batches(generate_data, batch_size: 2)
      end
    
      def chunked_stream
        stream_json_in_batches(generate_data, chunked: true, batch_size: 2)
      end
    
      private

      def generate_data
        Page.where('id < 10')
      end
    end

 

    undr$ telnet localhost 3000
    Trying ::1...
    telnet: connect to address ::1: Connection refused
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    GET /chunked_stream
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":1,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":2,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":3,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":4,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":5,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":6,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":7,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":8,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    1a0
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":9,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    0

 

    undr$ telnet localhost 3000
    Trying ::1...
    telnet: connect to address ::1: Connection refused
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    GET /stream
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":1,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":2,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":3,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":4,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":5,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":6,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":7,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":8,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>\n\n<p>Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; D","created_at":"2013-08-26T20:11:11Z","id":9,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]Connection closed by foreign host.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
