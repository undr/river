# River

River renders JSON to a stream using the batch iteration

## Installation

Add this line to your application's Gemfile:

    gem 'river', github: 'undr/river'

And then execute:

    $ bundle


## Usage

    class HomeController < ApplicationController
      before_filter :find_pages

      def stream
        stream_json_in_batches(@pages, batch_size: 2)
      end

      def chunked_stream
        stream_json_in_batches(@pages, chunked: true, batch_size: 2)
      end

      private

      def find_pages
        @pages = Page.where('id < 10')
      end
    end

Or:

    class HomeController < ApplicationController
      respond_to :json

      before_filter :find_pages

      def stream
        respond_with(@pages, in_batches: { batch_size: 2 })
      end

      def chunked_stream
        respond_with(@pages, in_batches: { chunked: true, batch_size: 2 })
      end

      private

      def find_pages
        @pages = Page.where('id < 10')
      end
    end

Chunked JSON:

    undr$ telnet localhost 3000
    Trying ::1...
    telnet: connect to address ::1: Connection refused
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    GET /chunked_stream
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":1,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":2,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":3,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":4,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":5,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":6,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    33f
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":7,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":8,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    1a0
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":9,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]
    0

Not chunked JSON: 

    undr$ telnet localhost 3000
    Trying ::1...
    telnet: connect to address ::1: Connection refused
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    GET /stream
    [{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":1,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":2,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":3,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":4,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":5,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":6,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":7,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":8,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"},{"body":"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</p>","created_at":"2013-08-26T20:11:11Z","id":9,"title":"Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit","updated_at":"2013-08-26T20:11:11Z"}]



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
