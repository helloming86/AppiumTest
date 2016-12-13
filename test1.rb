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

#puts get_source


#以scrollview的出现作为页面加载完毕的判断
wait {element = find_element(:id,'com.qtcem.yexiu:id/scrollview')}
puts find_element(:id,'com.qtcem.yexiu:id/scrollview').location

#swipe方法说明
#swipe相当于在Appium里面执行如下动作：1.短按press2.等待wait3.移动到MoveTo4.释放release
#理解swipe在Appium里面的执行非常重要
#已手指上滑加载新的内容为例，将动作分解为Appium的指令：手指短按[0.9,0.8]位置，在800毫秒内，移动至[0.9,0.1]位置后，松开手指
#手指上滑加载更多，意味着X不变，Y变，对应swipe代码如下
#swipe(:start_y => 0.8,:delta_y => -0.7,:start_x => 0.9, :delta_x => 0, :duration => 800)
#对应Appium执行过程如下
# {"actions":[{"action":"press","options":{"x":0.9,"y":0.8}},{"action":"wait","options":{"ms":800}},{"action":"moveTo","options":{"x":0.9,"y":0.10000000000000009}},{"action":"release"}]}
#下面对swipe命令进行分解
#start为起始位置，delta为偏移量(有-表示减，无符号表示增)，duration为时间参数单位是毫秒
#假定模拟器大小为1080*1776（DISPLAY BOUNDS [0,0][1080,1776]）
#将start和delta进行换算，起始x为1080*0.9=972，起始y为1776*0.8=1420.8，偏移x为0，偏移y为1776*0.7=1243.2
#结束时X位置为仍0.9即972，Y为0.1即177.6
#以上完美实现了上滑加载更多内容

#首页上滑，加载更多内容
swipe(:start_y => 0.8,:delta_y => -0.7,:start_x => 0.9, :delta_x => 0, :duration => 800)
sleep 1




#同城聚左右滑动
#点击查看资讯
#切换到“我”分页
#登录

sleep 5

#关闭driver
driver_quit
