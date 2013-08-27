module River
  class Responder < ::ActionController::Responder
    def to_json
      if batchable?
        controller.stream_json_in_batches(resource, batch_options)
      else
        to_format
      end
    end

    def batchable?
      options[:in_batches] && resource.respond_to?(:find_in_batches)
    end

    def batch_options
      return {} unless options[:in_batches].is_a?(Hash)
      options[:in_batches]
    end
  end
end
