#依赖关系
require 'rubygems'
require 'appium_lib'
require 'rspec/expectations'

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

#puts get_settings
#puts session_id
#puts window_size

#以scrollview的出现作为页面加载完毕的判断
wait {element = find_element(:id,'com.qtcem.yexiu:id/scrollview')}
ell = find_element(:id,'com.qtcem.yexiu:id/scrollview')
puts ell.location
puts ell.display
puts ell.displayed?

puts "当前页面的Activity是：" + current_activity

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
#swipe(:start_y => 0.8,:delta_y => -0.7,:start_x => 0.9, :delta_x => 0, :duration => 800)
#sleep 1

#同城聚左右滑动
#首页下滑，返回主页面
#swipe(:start_y => 0.1,:delta_y => 0.2,:start_x => 0.9, :delta_x => 0, :duration => 800)
#sleep 1
#定位同城聚模块
#cityparty = find_element(:uiautomator,'new UiSelector().resourceId("com.qtcem.yexiu:id/recy_city_party")')
#输出位置信息
#sleep 1
#puts cityparty.size
#puts cityparty.location.x
#puts cityparty.location.y
#puts cityparty.size.height
#puts cityparty.size.width
#左右滑动
#swipe(:start_y => cityparty.location.y + cityparty.size.height/2,:delta_y => 0,:start_x => cityparty.size.width - 10, :delta_x => -cityparty.size.width + 20, :duration => 800)
#点击记录跳转页面
#默认点击的定位到元素的中间部位
#这里没有对记录进行定位，查看的记录由上面的滑动操作决定了
#cityparty.click


#点击查看资讯
#这里对记录进行定位，查看指定资讯

#滑动到资讯模块
#直到包含天气变凉的记录出现
#使用find_element定位时，如果找不到元素，会直接抛异常，而不是返回false
#所以，在处理这种情况时，有两种方法：1.使用异常处理机制 2.使用find_elements

#使用异常处理机制，该方法验证通过

=begin

#包含异常处理机制的代码块begin...end
begin
  #需要执行的代码
  puts "进行元素定位"
  sleep 1
  text_textview = find_element(:uiautomator, 'new UiSelector().className("android.widget.TextView").textContains("主题影院")')
  puts text_textview.text
  #如果上面不出错，会执行下面的puts语句
  puts 'I am before the raise.'
  #抛出异常
  #如果begin模块有raise，即便上面的代码没有出错，也会进入rescue模块,不建议使用raise
  #raise "Error Message"
  #如果上面出错，不会执行下面的puts语句
  puts 'I am after the raise.'
#处理异常，出错后执行rescue块的语句
rescue Exception => e
  puts "主体出错，跳转至rescue异常处理模块执行代码"
  #输出报错信息到控制台
  puts e.message
  #输出错误位置到控制台
  puts e.backtrace.inspect
  #需要执行的代码
  #滑动页面
  puts "执行rescue块的swipe指令"
  swipe(:start_y => 0.8,:delta_y => -0.5,:start_x => 0.9, :delta_x => 0, :duration => 500)
  puts "swipe指令执行完毕，等待一秒"
  sleep 1
  #使用Retry重新到begin位置
  puts "异常处理完毕，执行retry命令，返回begin位置"
  retry
#else子句的主体只有在代码主体没有抛出异常时执行，else子句一般放置在rescue之后，任意ensure之前
else
  puts "主体未出错，执行到else模块"
  puts text_textview.display
  puts text_textview.display.nil?
  #点击元素
  text_textview.click
  #等待页面加载完毕
  wait {find_element(:id,'com.qtcem.yexiu:id/webview')}
#不管有无异常，均执行的部分
ensure
  puts "有无异常均执行的部分"
end



#使用find_elements、swipe和循环，可以定位到元素，使用是否为空(empty?)作为条件进行判断
#使用display和nil，不论是否定位到元素，text_textview.display.nil?都一直为ture，不能作为退出循环的判断
#研究ruby下的appium API文档后，发现可以用empty来处理，具体方法如下
#判断find_elements是否为空，为空继续操作；不为空，跳出循环；
#find_elements(:id, 'XXX').empty?
puts "定位页面元素，使用findelements定位"
text_textview = find_elements(:uiautomator, 'new UiSelector().className("android.widget.TextView").textContains("主题影院")')
puts "输出定位结果"
puts "定位元素为空？" + text_textview.empty?.to_s
puts text_textview.display
while  text_textview.empty? do
  puts "进入循环，滑动页面"
  swipe(:start_y => 0.8,:delta_y => -0.5,:start_x => 0.9, :delta_x => 0, :duration => 500)
  puts "swipe命令执行完毕，等待一秒"
  sleep 1
  puts "循环中重新定位元素"
  text_textview = find_elements(:uiautomator, 'new UiSelector().className("android.widget.TextView").textContains("主题影院")')
  puts "输出循环中定位结果"
  puts "定位元素为空？" + text_textview.empty?.to_s
  puts text_textview.display
end
#定位到元素后，执行点击操作
unless text_textview.empty? then
  #因为是find_elements，是一组数据，所以要指定index
  #第一条数据，index为0
  text_textview[0].click
end

=end

#切换到“我”分页
puts "点击我进入个人中心"
find_element(:id,'com.qtcem.yexiu:id/rel_mine').click
puts "等待5秒"
sleep 5

puts "通过uiautomator定位设置，并打印text属性"
setNode = find_element(:uiautomator, 'new UiSelector().className("android.widget.TextView").text("设置")')
puts setNode.text
puts setNode.display
#text_exact和display输出的结果一样？从控制台输出看，是一致的
#text_exact方法很有意思
puts "使用text_exact方法定位设置"
puts text_exact("设置")

#检查点
puts "使用exists和text方法判断设置是否存在作为检查点"
puts text('设置')
exists{text('设置')} ? puts('true') : puts('false')
puts "当前页面的Activity是：" + current_activity


#未登录点击卡包
puts "点击卡包"
find_element(:id,'com.qtcem.yexiu:id/ll_card').click
puts "等待alert出现"
wait { @aat = alert_accept_text}
puts "打印accept的text"
puts @aat
puts "校验"
if @aat.include?("去登录") then
  puts "还未登录"
else
  puts "已登录"
end



#登录
#点击登录
find_element(:id,'com.qtcem.yexiu:id/ll_click').click

#检查点，页面跳转
#textfield_exact是精准匹配，textfield是模糊匹配，实测模糊匹配不能使用正则表达式，带s是全部，不带是第一个
#在做匹配时，优先考虑模糊匹配；另根据实际情况，考虑是否带s
#同理，text，button也是一样的机制
exists{textfield("输入")} ? puts('正确跳转') : puts('未正确跳转')
puts textfield('输入').text

puts "当前页面的Activity是：" + current_activity

puts "输入用户名和密码，点击登录"
textfields[0].type "15237961489"
textfields[1].type "123123"
text("立即登录").click

sleep 10

#检查点
puts "当前页面的Activity是：" + current_activity
#从功能的角度设置检查点
#如登录成功，点击卡包，会跳转到卡包页(.mine.MyCardBag)
puts "点击卡包"
find_element(:id,'com.qtcem.yexiu:id/ll_card').click
sleep 3
puts "当前页面的Activity是：" + current_activity
if current_activity.include?("MyCardBag")
  puts "点击卡包，跳转至新页，而不是提示登录，正常"
end
sleep 5
#关闭driver
driver_quit
