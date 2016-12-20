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
        verifyTextExist1("设置")
      end
    end

    class MeTab < HomePage
      def toLogin
        #Todo
        #点击登录
        find_element(:id,'com.qtcem.yexiu:id/ll_click').click
        #检查点，页面跳转，判断登录页面是否正确弹出
        sleep 2
        verifyTextfieldExist1("输入")
      end

      def clickKabao
        #点击卡包
        find_element(:id,'com.qtcem.yexiu:id/ll_card').click
        sleep 2
        #检查点，判断是否进入卡包详情页
        verifyTextExist1("我的心情卡")
      end

    end

  end
end
