require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "ActiveCouch::RawView #map method" do
  before(:each) do
    class ByName < ActiveCouch::RawView
      map 'function(doc) { emit(null, doc); }'
    end
  end
  
  after(:each) do
    Object.send(:remove_const, :ByName)
  end
  
  it "should set @map_function with the value given" do
    ByName.instance_variable_get("@map_function").should == 'function(doc) { emit(null, doc); }'
  end
end

describe "ActiveCouch::RawView #reduce method" do
  before(:each) do
    class ByAge < ActiveCouch::RawView
      reduce 'function(doc) { emit(null, doc); }'
    end
  end
  
  after(:each) do
    Object.send(:remove_const, :ByAge)
  end
  
  it "should set @reduce_function with the value given" do
    ByAge.instance_variable_get("@reduce_function").should == 'function(doc) { emit(null, doc); }'
  end
end

describe "ActiveCouch::RawView #database method" do
  before(:each) do
    class ByTemperature < ActiveCouch::RawView
      for_database 'mclovin'
    end
  end
  
  after(:each) do
    Object.send(:remove_const, :ByTemperature)
  end
  
  it "should set @database with the value given" do
    ByTemperature.instance_variable_get("@database").should == 'mclovin'
  end
end