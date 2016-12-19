require 'rubygems'
require 'appium_lib'
require 'rspec/expectations'

=begin
desired_caps = {
  caps:
    {
      'platformName' => 'Android',
      'platformVersion' => '6.0',
      'deviceName' => 'emulator-5554',
      'appPackage' => 'com.qtcem.yexiu',
      'appActivity' => '.Home'
    },
  appium_lib:
    {
      sauce_username: nil,
      sauce_access_key: nil,
      debug: true
    }
}
=end
puts File.dirname(__FILE__)+'/androidsim/appium.txt'
puts File.expand_path('../androidsim/appium.txt', __FILE__)
desired_caps = Appium.load_appium_txt file: File.expand_path('../androidsim/appium.txt', __FILE__), verbose: true
puts desired_caps
Appium::Driver.new(desired_caps)
Appium.promote_appium_methods self.class
