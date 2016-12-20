module Screen
  module Android
    class ParyPage
      include LocatorModule
      include GestureModule
      include OtherModule
      def page_load
        sleep 2
        puts "当前页面的Activity是：" + current_activity
        sleep 1
      end
    end
  end
end
