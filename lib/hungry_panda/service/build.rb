require 'rest-client'
require 'json'

module HungryPanda
  module Service
    class Build
      def initialize(base_url, key)
        @key = key
        @all_url = "#{base_url}result/#{key + format}"
      end
      
      #return hash of all builds with given key
      def all
        response = RestClient.get(@all_url, params)
        parsed = JSON.parse(response)
        
        parsed['results']['result']
      end
      
      #return hash object for latest build
      def latest
        url = @base_url + "result/#{key}-latest#{format}"
        response = RestClient.get(url)
        
        JSON.parse(response)
      end
      
      def specific_build(number)
        url = @base_url + "result/#{key}-#{number + format}"
        response = RestClient.get(url)
        
        JSON.parse(response)
      end
      
      private
      attr_reader :base_url
      
      #What if there are more than 1000 plans?
      def params
        { :params => { 'max-results' => '1000' }}
      end
      
      def format
        '.json'
      end
      
    end
  end
end