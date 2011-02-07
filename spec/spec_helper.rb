$:.push File.join(File.dirname(__FILE__), '..', 'lib')
%w(rspec rubbr).each { |lib| require lib }
