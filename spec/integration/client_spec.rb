require 'integration_spec_helper'
require 'hungry_panda/client'

module HungryPanda
  describe "A Client" do
    describe "plans" do
      it "grabs the plans from Bamboo Rest API" do
        key = "APPDEVSYSTEMHOTPATCH-WATSFINCSHSYSTEM"
        
        options = { :username => ENV["BAMBOO_USERNAME"], 
                    :password => ENV["BAMBOO_PASSWORD"],
                    :domain   => "bamboo13.workday.com"
                  }
        
                  
        client = HungryPanda::Client.new(options)
        
        expect { client.plans }.to_not raise_error          
      end
    end    
  end
end