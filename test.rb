#依赖关系
require 'rubygems'
require 'appium_lib'

#Appium server capabilities 预设
caps = {
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

#设置server_url
server_url = "http://0.0.0.0:4723/wd/hub"

#对象化并启动driver
Appium::Driver.new(caps).start_driver
Appium.promote_appium_methods Object

#使用get_source方法获取应用当前页面展示的元素，格式是XML
puts get_source

#元素定位

#By id，原生Webdriver方法，推荐使用
#id对应resource-Id
#find_element(:id,"com.hjwordgames:id/sign_in").click

#By Name，原生Webdriver方法，不推荐使用，新版本appium开始不再支持name定位
#name对应test

#By class，原生Webdriver方法,不推荐使用
#使用Class一般获得的view都不止一个
#所以应该需要遍历一遍得到的views，然后缩写搜索条件来获得目标控件
#如果仅有一个view，则不需要遍历
#但是因为不确定是否只有一个，所以使用class时，还是建议进行遍历
#find_elements(:class,'android.widget.ImageView')

#By Xpath，原生Webdriver方法，尽量避免使用
#不推荐原因 1.定位速度慢 2.组装xpath时间长
#假如同一层有多个相同的小部件，编号从1开始，比如取第二个FrameLayout，则为：FrameLayout[2]
#find_element(:xpath,'//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout[1]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ImageView[2]').click

#使用Mobile JSON Wire Protocol 协议中定义的方法，更适合移动设备上的控件定位
#ios uiautomation: a string corresponding to a recursive element search using the UIAutomation library (iOS-only)
#android uiautomator: a string corresponding to a recursive element search using the UiAutomator Api (Android-only)
#accessibility id: a string corresponding to a recursive element search using the Id/Name that the native Accessibility options utilize
#find_element :accessibility_id, 'Animation'
#find_elements :accessibility_id, 'Animation'
#find_element :uiautomator, 'new UiSelector().clickable(true)'
#find_elements :uiautomator, 'new UiSelector().clickable(true)'

#By Android uiautomator，推荐使用resourceid和description
#resourceId对应resource-Id  className对应class  description对应content-desc text对应text
#find_element(:uiautomator,'new UiSelector().resourceId("com.hjwordgames:id/sign_in")').click
#根据类名找第一个textview
#first_textview = find_element(:uiautomator, 'new UiSelector().className("android.widget.TextView").instance(0)');
#根据文本 (text) 找到第一个元素。
#first_text = find_element(:uiautomator, 'new UiSelector().text("Animation")')
#first_text.text # "Animation"
#找到第一个可滚动的元素， 然后找到文本是 “Tabs” 的文本控件。 “Tabs” 元素就是将要滚动到的控件。
#element = find_element(:uiautomator, 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).getChildByText(new UiSelector().className("android.widget.TextView"), "Tabs")')
#scrollIntoView 是一个特例，会返回滚动到指定控件的元素。 scrollIntoView 对任何的 UiSelector 都可以执行滚动操作。
#element = find_element(:uiautomator, 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text("WebView").instance(0));')
#element.text # "WebView"

#By accessibility，推荐使用
#accessibility_id对应content-desc
#find_element(:accessibility_id,'Apps').click

sleep 20

#关闭driver
driver_quit
