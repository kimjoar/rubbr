$:.push File.join(File.dirname(__FILE__), '..', 'lib')
%w(spec rubbr).each { |l| require l }
