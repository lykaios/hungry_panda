require 'integration_spec_helper'
require 'hungry_panda/client'

module HungryPanda
  describe "A Client" do
    before(:each) do
      @options = { :username => ENV["BAMBOO_USERNAME"], 
                  :password => ENV["BAMBOO_PASSWORD"],
                  :domain   => "bamboo13.workday.com"}
      @client = client = HungryPanda::Client.new(@options)
    end
    
    describe "plans" do
      it "grabs the plans from Bamboo Rest API" do
        client = HungryPanda::Client.new(@options)  
        #VCR.use_cassette(:plans) do
        expect(client.plans.count).to eq(808)        
        #end                
      end
    end
    
    describe "plan" do
      it 'should return a Plan object if key passed a correct key' do
        key = "APPDEVSYSTEMHOTPATCH-WATSFINCSHSYSTEM"
        plan = @client.plan(key)
        
        expect(plan.project_name).to eq("AppDev System Hotpatch Prod")
      end
      
      it 'should raise a resource not found error when Key doesnt exist' do
        key = "idontexist"
        plan = @client.plan(key)

        expect{plan.name}.to raise_error(RestClient::ResourceNotFound)
      end
      
    end    
  end
end