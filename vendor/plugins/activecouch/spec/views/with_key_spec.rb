require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "ActiveCouch::View #with_key method" do
  before(:each) do
    class ByName < ActiveCouch::View
      define :by_name, :for_db => 'people' do
        with_key 'name'
      end
    end
  end
  
  after(:each) do
    Object.send(:remove_const, :ByName)
  end
  
  it "should set @key correctly" do
    ByName.instance_variable_get("@key").should == 'name'
  end
end
