require 'spec_helper'

Mime = Module.new
Mime::JSON = 'application/json'

class StubController
  include River::ActionController

  attr_accessor :response_body

  def response
    @response ||= Struct.new(:headers).new('Content-Length' => 123)
  end
end

describe River::ActionController do
  describe '#stream_json_in_batches', time_freeze: Time.now do
    subject{ StubController.new }

    let(:scope){ double(:scope) }
    let(:options){ {} }
    let(:headers){ {
      'Cache-Control' => 'no-cache',
      'Last-Modified' => Time.now.to_s,
      'Content-Type' => 'application/json'
    } }

    before{ subject.stream_json_in_batches(scope, options) }

    specify{ subject.response_body.should be_instance_of(River::Streamer) }
    specify{ subject.response.headers.should eq(headers) }

    context 'with chunked option' do
      let(:options){ { chunked: true } }

      before{ headers['Transfer-Encoding'] = 'chunked' }

      specify{ subject.response_body.should be_instance_of(River::Streamer) }
      specify{ subject.response.headers.should eq(headers) }
    end
  end
end
