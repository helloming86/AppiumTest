#encoding=utf-8

假如(/^进入个人中心点击登录$/) do
  home_page.toMeTab
  me_tab.toLogin
  me_tab.captureScreen("toLogin")
end

当(/^输入手机号和密码进行登录$/) do
  login_page.loginAs("15237961489","123123")
  login_page.captureScreen("login")
end

那么(/^登录成功点击卡包进详情页$/) do
  me_tab.clickKabao
  me_tab.captureScreen("afterLogin")
end
