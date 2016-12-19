module Screen
  module Android
    class LoginPage
      include LocatorModule
      include GestureModule
      include OtherModule
      def page_load
        sleep 2
        puts "当前页面的Activity是：" + current_activity
      end
    end

    class CommonLogin < LoginPage
      def loginAs(username,userpwd)
        #Todo
        textfields[0].type username
        textfields[1].type userpwd
        text("立即登录").click
      end

      def toRegister
        #Todo
        #点击注册
        text("注册").click
        #检查点，页面跳转，判断登录页面是否正确弹出
        sleep 2
        verifyTextfieldExist1("立即注册")
        #exists{textfield("立即注册")} ? puts('点击注册按钮后正确跳转') : puts('点击注册按钮后未正确跳转')
        #raise("点击注册按钮后页面未正确跳转") unless exists{textfield("立即注册")}
      end
    end

  end
end
