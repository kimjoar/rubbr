require File.join(File.dirname(__FILE__), 'spec_helper')

describe Rubbr do
  # describe :parser do
  #   it "returns an instance of OptionParser" do
  #     Rubbr.send(:parser).should be_an(OptionParser)
  #   end
  #   
  #   it "returns the same instance on every method call" do
  #     parser = Rubbr.send(:parser)
  #     Rubbr.send(:parser).should == parser
  #   end
  # end
  
  describe :run do
    after do
      Rubbr.send(:cmd_opts).clear
    end
    
    it "parses the options" do
      opts = ['-f']
      Rubbr.send(:parser).should_receive(:parse!).with(opts)
      Rubbr.run opts
    end
    
    it "runs the spellchecker if the 'spell' option is set" do
      spell = double 'spell'
      spell.should_receive :check
      Rubbr::Spell.should_receive(:new).and_return(spell)
      Rubbr.run ["-s"]
    end
    
    it "displays the document if the 'view' option is set" do
      Rubbr::Builder.should_receive :build
      Rubbr::Viewer.should_receive :view
      Rubbr.run ["-d"]
    end
    
    it "should build the document unless the 'spell' option is set" do
      Rubbr::Builder.should_receive :build
      Rubbr.run      
    end
  end
end
