=begin

Author: hank@rubyslacker.com

Requirements: 
ActiveRecord gem and related database gems must be installed. 
Edit database.yml to your needs
Usage: ruby wordpress_ar_console.rb

Example: Post.find(:all)
=end

require "rubygems" 
require "activerecord"
require "yaml" 
require 'lib/wordpress_models'
require 'lib/irb_shell.rb'

ActiveRecord::Base.establish_connection(YAML.load_file("./wp_database.yml"))

#drop in the schema/models
include RubySlacker::WordpressModels
include IRB


#now actually fire up irb
  
  class Object
     include IRB::ExtendCommandBundle # so that Marshal.dump works
  end
  
    if __FILE__ == $0
       x = Object.new
       puts "\nStarted Wordpress ActiveRecord irb shell..."
       IRB.start_session(x)
       puts "\nStarted Wordpress ActiveRecord irb shell with current binding..."
       IRB.start_session(binding, x)
       puts "\nRestarted Wordpress ActiveRecord irb shell with current binding..."
       $irb.eval_input
       puts "\nExited irb shell"
       p x
    end






