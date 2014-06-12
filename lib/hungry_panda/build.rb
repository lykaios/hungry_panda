module HungryPanda
  
  class Build
    def initialize(base_url, remote_hash)
      @base_url = base_url
      @remote_hash = remote_hash
    end
    
    #TODO how can we handle the case where we have an intial sketch of a build, 
    # say from a Plan.builds type call, so we need to get more info. But sometimes
    # we might say Plan.latest_build and that will return a complete REST object
    def fetch
      build_key = @remote_hash['buildResultKey']
      build_number = @remote_hash['buildNumber']
      key = @remote_hash['plan']['key']
      
      @remote_hash = Service::Build.new(@base_url,key).specific_build(build_number)
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