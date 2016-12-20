module Screen
  module Android
    class WebPage
      include LocatorModule
      include GestureModule
      include OtherModule
      def page_load
        sleep 2
        puts "当前页面的Activity是：" + current_activity
        puts "当前页面的context是：" + current_context
        puts "所有可用的context是: " + available_contexts.to_s
        #方法一
        #切换到WEB，set_context
        set_context "WEBVIEW_com.qtcem.yexiu"
        #操作WEB页面
        puts  find_element(:id,"body").find_element(:css,"#body > div > div.title").text
        #返回NATIVE_APP，set_context "NATIVE_APP" 或 switch_to_default_context
        switch_to_default_context
        #方法二
        #直接在web里面操作
        #within_context('WEBVIEW_com.qtcem.yexiu') do
        #  puts  find_element(:id,"body").find_element(:css,"#body > div > div.title").text
        #end
        sleep 1
      end
    end

    class NewsDetailPage < WebPage
      #Todo

    end

  end
end
