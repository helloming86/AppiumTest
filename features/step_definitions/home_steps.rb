#encoding=utf-8

假如(/^打开APP首页等待加载完毕$/) do
  home_page.page_load
  home_page.captureScreen("startHOME")
end

当(/^向上滑动超过一屏页面$/) do
  #两次上滑70%
  home_page.scrollScreen70("Up")
  home_page.captureScreen("swipHome")
  home_page.scrollScreen70("Up")

end

那么(/^出现搜索框$/) do
  home_page.verifyTextExist1("请输入你要搜索的内容")
  home_page.captureScreen("afterswipeHome")
end
