#encoding=utf-8

假如(/^打开APP首页等待加载完毕$/) do
  wait {element = find_element(:id,'com.qtcem.yexiu:id/scrollview')}
  ell = find_element(:id,'com.qtcem.yexiu:id/scrollview')
  puts ell.location
  puts ell.display
  puts ell.displayed?
  puts "当前页面的Activity是：" + current_activity
  #puts get_source
end

当(/^向上滑动页面$/) do
  #向上滑动屏幕的70%
  swipe(:start_y => 0.8,:delta_y => -0.7,:start_x => 0.9, :delta_x => 0, :duration => 800)
  swipe(:start_y => 0.8,:delta_y => -0.7,:start_x => 0.9, :delta_x => 0, :duration => 800)
  sleep 1
end

那么(/^出现搜索框$/) do
  #检查点
  #两种写法，分别使用了empty和exists
  #如果使用raise写法，出错时会输入日志，方便查找原因
  wait{ raise("未出现搜索框，参错误信息") if texts("请输入你要搜索的内容").empty? }
  exists{text("请输入你要搜索的内容")} ? puts('出现搜索框') : puts('未出现搜索框')
end
