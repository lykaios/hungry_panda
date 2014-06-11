require 'rest-client'

module HungryPanda
  class Client
    attr_accessor :base_url, :username, :password, :format
  
    #notes
    #probably need one object for BambooClient, another for BambooPlan, and another for BambooBuild
    #patchdash will mostly be concerned with connecting to different bamboo endpoints
    # and then checking the -latest build result for a given plan. 
    #============================================================

    #accepts a symbol hash for attributes, defaults to json return format. 
    def initialize(options)
      #need to figure out what version to use, how can we let people control this?
      @username = options.fetch(:username)
      @password = options.fetch(:password)
      domain = options.fetch(:domain)
      @format = '.json'
      @base_url = "https://#{username}:#{password}@#{domain}/rest/api/latest/"
    end

    #What if there are more than 1000 plans?
    def plans
      response = RestClient.get "#{base_url}plan#{format}", 'expand' => 'plans', 'max-results' => '1000'
      parsed_hash = JSON.parse(response.body)
      plan_list = parsed_hash['plans']['plan']

      return plan_list.map{|p| Plan.new(self, p['key'])}
    end

  end
  
  class Plan
    def initialize(connection, key)
    end
  end
end