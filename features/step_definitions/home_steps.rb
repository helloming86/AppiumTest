#encoding=utf-8

假如(/^打开APP首页等待加载完毕$/) do
  home_page.page_load
  home_page.captureScreen("startHOME")
end
当(/^定位到主题趴模块向左滑动半屏并点击$/) do
  el = home_page.byId("com.qtcem.yexiu:id/recy_theme_party")
  ep = home_page.getposition(el)
  home_page.absoSwipe(ep[0],ep[1],ep[2],ep[3],"Left")
  el.click
end
那么(/^进入同城聚详情页$/) do
  party_page.page_load
  party_page.verifyTextExist1("活动详情")
  party_page.back
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

当(/^首页一直上滑直到出现指定资讯后点击$/) do
  home_page.specifyLists("主题影院")
end
那么(/^进入指定资讯详情页$/) do
  newsdetail_page.page_load
end
