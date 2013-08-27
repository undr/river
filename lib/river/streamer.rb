module River
  class Streamer
    def initialize scope, options = {}
      @chunked = !!options.delete(:chunked)
      @scope = scope
      @options = options.except(:limit, :order)
    end

    def each &block
      chunked? ? chunked_json_each(&block) : unchunked_json_each(&block)
    end

    private

    attr_reader :scope, :chunked, :options

    def chunked_json_each
      term = "\r\n"
      tail = "0#{term}#{term}"
      scope.find_in_batches(options) do |items|
        chunk = encode(items)
        size = chunk.bytesize
        next if size == 0

        chunk = chunk.dup.force_encoding(Encoding::BINARY) if chunk.respond_to?(:force_encoding)
        yield [size.to_s(16), term, chunk, term].join
      end
      yield tail
    end

    def unchunked_json_each
      first_comma = ''
      yield '['
      scope.find_in_batches(options) do |items|
        yield first_comma + encode(items)
        first_comma = ','
      end
      yield ']'
    end

    def encode items
      result = MultiJson.dump(items)
      result = result[1...-1] if !chunked? && result.start_with?('[')
      result
    end

    def chunked?
      !!chunked
    end
  end
end
