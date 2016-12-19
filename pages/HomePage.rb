module Screen
  module Android
    class HomePage
      include LocatorModule
      include GestureModule
      include OtherModule
      def page_load
        sleep 2
        puts "当前页面的Activity是：" + current_activity
        sleep 1
      end

      def toMeTab
        #切换到“我”分页
        find_element(:id,'com.qtcem.yexiu:id/rel_mine').click
        sleep 5
        #检查点
        exists{text('设置')} ? puts('出现设置选项切换分页正常') : puts('未出现设置选项切换分页异常')
        raise("点击切换到个人中心异常请检查原因") unless exists{text('设置')}
      end
    end

    class MeTab < HomePage
      def toLogin
        #Todo
        #点击登录
        find_element(:id,'com.qtcem.yexiu:id/ll_click').click
        #检查点，页面跳转，判断登录页面是否正确弹出
        sleep 2
        exists{textfield("输入")} ? puts('点击登录按钮跳转至登录页面') : puts('点击登录按钮后未跳转至登录页面')
        raise("点击登录未跳转至登录页面请排查原因") unless exists{textfield("输入")}
      end

      def clickKabao
        #点击卡包
        find_element(:id,'com.qtcem.yexiu:id/ll_card').click
        sleep 2
        #检查点，判断是否进入卡包详情页
        exists{text('我的心情卡')} ? puts('已登入卡包详情页') : puts('未登入卡包详情页')
        raise("未成功登入卡包详情页请检查原因") unless exists{text('我的心情卡')}
      end

    end

  end
end
