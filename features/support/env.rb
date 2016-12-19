require 'rubygems'
require 'appium_lib'
require 'rspec/expectations'
require_relative 'base_mod'

puts File.dirname(__FILE__)+'/androidsim/appium.txt'
puts File.expand_path('../androidsim/appium.txt', __FILE__)
desired_caps = Appium.load_appium_txt file: File.expand_path('../androidsim/appium.txt', __FILE__), verbose: true
Appium::Driver.new(desired_caps)
Appium.promote_appium_methods self.class
#Appium.promote_appium_methods Object
#不使用下面的方式处理，参base_mod末尾的备注
#Appium.promote_appium_methods MyAppPage
