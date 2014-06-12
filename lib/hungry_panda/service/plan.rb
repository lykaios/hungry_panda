require 'rest-client'
require 'json'

module HungryPanda
  module Service
    class Plan
      def initialize(base_url)
        @base_url = base_url
      end
      
      def all
        parsed_response['plans']['plan']
      end

      #TODO - ensure key is not nil
      def fetch_plan(key)
        new_url = "#{base_url}plan/#{key + format}"
        new_response = RestClient.get(new_url)
        JSON.parse(new_response)
      end
      
      private
      attr_reader :base_url
      
      def url
        "#{base_url}plan#{format}"
      end
      
      #What if there are more than 1000 plans?
      def params
        { :params => { 'max-results' => '1000' }}
      end
      
      def format
        '.json'
      end
      
      def response
        @response ||= RestClient.get(url, params)
      end
      
      def parsed_response
        @parsed_response ||= JSON.parse(response)
      end
    end
  end
end