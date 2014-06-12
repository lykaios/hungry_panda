module HungryPanda
  class Plan
    
    def initialize(base_url, key)
      @base_url = base_url
      @key = key
    end
    
    def latest_build    
      build_hash = Service::Build.new(base_url, key).latest
  
      Build.new(base_url, build_hash)
    end  
    
    def name
      remote_object['buildName']
    end
    
    def project_name
      puts remote_object
      remote_object['projectName']
    end
    
    private
    attr_reader :key, :base_url
    def remote_object
      @remote_object ||= Service::Plan.new(@base_url).fetch_plan(key)
    end
    
  end
    
end