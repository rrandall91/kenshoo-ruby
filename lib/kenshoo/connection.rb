module Kenshoo
  module Connection

    def post(url, payload)
      data = payload.to_json
      request = Faraday.new
      request.basic_auth(Kenshoo.options[:username], Kenshoo.options[:password])
      response = request.post do |req|
        req.url url
        req.headers["Content-Type"] = 'application/json'
        req.body = data
      end
      return response
    end

    module ClassMethods
      def build_url(route = {}, params = {})
        url = "#{Kenshoo.options[:endpoint]}"

        ## Build the route
        url << "/#{Kenshoo.options[:version]}"
        url << "/#{route[:resource]}"
        url << "/#{route[:id]}" if !route[:id].nil?
        url << "/#{route[:member]}" if !route[:member].nil?
        url << "/#{route[:identifier]}" if !route[:identifier].nil?
        url << "/#{route[:method]}" if !route[:method].nil?
        url << "?ks=#{Kenshoo.options[:ks_id]}"

        ## Append URL parameters
        url << append_params(params) unless params.empty?
        return url
      end

      def append_params(params)
        query_string = ''
        params.each do |key, value|
          next if value.nil?
          query_string << "&#{key.to_s}=#{value}"
        end
        return query_string
      end

      def get(url)
        request = Faraday.new
        request.basic_auth(Kenshoo.options[:username], Kenshoo.options[:password])
        response = request.get(url)
        return JSON.parse(response.body)
      end
    end
  end
end
