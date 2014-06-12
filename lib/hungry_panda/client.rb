require 'hungry_panda/service/plan'
require 'hungry_panda/plan'

module HungryPanda
  class Client
    
  
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
      @domain = options.fetch(:domain)
      @format = options.fetch(:format) { '.json' }
    end


    def plans
      plan_list = Service::Plan.new(url).all

      plan_list.map{|p| Plan.new(url, p['key'])}
    end
    
    def plan(key)
      Plan.new(url, key)
    end
    
    #def projects
    #  response = RestClient.get projects_endpoint, projects_params
    #  parsed_hash = JSON.parse(response.body)
    #  project_list = parsed_hash['projects']['project']
      
    #  project_list.map{|project| Project.new(self, project['key']) }
    #end

    private
    attr_accessor :username, :password, :domain, :format
    
    def url
      "https://#{username}:#{password}@#{domain}/rest/api/latest/"
    end
    
    
    def projects_endpoint
      "#{url}project#{format}"
    end
    
    def projects_params
      { 'expand' => 'projects', 'max-results' => '1000' }
    end 
  end
  
  
end