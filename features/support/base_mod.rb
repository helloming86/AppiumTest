#公共Module，页面需要时使用include引用

module LocatorModule
  #Todo: appium方法的参数化封装，主要封装定位方法和检查点

  #Text，对应android.widget.TextView
  #定义不存在的检查点，存在时报错

  def byId(id)
    find_element(:id, "#{id}")
  end

  def verifyTextNotExist1(content)
    wait do
      exists{text(content)} ? puts("出现：" + "#{content}") : puts("未出现：" + "#{content}")
      raise("不应该出现" + "#{content}" + "请检查原因") if exists{text(content)}
    end
  end
  def verifyTextNotExist2(content)
    wait do
      texts(content).empty? ? puts("未出现：" + "#{content}") : puts("出现：" + "#{content}")
      raise("不应该出现" + "#{content}" + "请检查原因") unless texts(content).empty?
    end
  end
  #定义出现的检查点，不出现时报错
  def verifyTextExist1(content)
    wait do
      exists{text(content)} ? puts("出现：" + "#{content}") : puts("未出现：" + "#{content}")
      raise("应该出现但实际未出现" + "#{content}" + "请检查原因") unless exists{text(content)}
    end
  end
  def verifyTextExist2(content)
    wait do
      texts(content).empty? ? puts("未出现：" + "#{content}") : puts("出现：" + "#{content}")
      raise("应该出现但实际未出现" + "#{content}" + "请检查原因") if texts(content).empty?
    end
  end

  #Button，对应android.widget.Button
  #定义不存在的检查点，存在时报错
  def verifyButtonNotExist1(content)
    wait do
      exists{button(content)} ? puts("出现：" + "#{content}") : puts("未出现：" + "#{content}")
      raise("不应该出现" + "#{content}" + "请检查原因") if exists{button(content)}
    end
  end
  def verifyButtonNotExist2(content)
    wait do
      buttons(content).empty? ? puts("未出现：" + "#{content}") : puts("出现：" + "#{content}")
      raise("不应该出现" + "#{content}" + "请检查原因") unless buttons(content).empty?
    end
  end
  #定义出现的检查点，不出现时报错
  def verifyButtonExist1(content)
    wait do
      exists{button(content)} ? puts("出现：" + "#{content}") : puts("未出现：" + "#{content}")
      raise("应该出现但实际未出现" + "#{content}" + "请检查原因") unless exists{button(content)}
    end
  end
  def verifyButtonExist2(content)
    wait do
      buttons(content).empty? ? puts("未出现：" + "#{content}") : puts("出现：" + "#{content}")
      raise("应该出现但实际未出现" + "#{content}" + "请检查原因") if buttons(content).empty?
    end
  end

  #TEXTFIELD，对应android.widget.EditText
  #定义不存在的检查点，存在时报错
  def verifyTextfieldNotExist1(content)
    wait do
      exists{textfield(content)} ? puts("出现：" + "#{content}") : puts("未出现：" + "#{content}")
      raise("不应该出现" + "#{content}" + "请检查原因") if exists{textfield(content)}
    end
  end
  def verifyTextfieldNotExist2(content)
    wait do
      textfields(content).empty? ? puts("未出现：" + "#{content}") : puts("出现：" + "#{content}")
      raise("不应该出现" + "#{content}" + "请检查原因") unless textfields(content).empty?
    end
  end
  #定义出现的检查点，不出现时报错
  def verifyTextfieldExist1(content)
    wait do
      exists{textfield(content)} ? puts("出现：" + "#{content}") : puts("未出现：" + "#{content}")
      raise("应该出现但实际未出现" + "#{content}" + "请检查原因") unless exists{textfield(content)}
    end
  end
  def verifyTextfieldExist2(content)
    wait do
      textfields(content).empty? ? puts("未出现：" + "#{content}") : puts("出现：" + "#{content}")
      raise("应该出现但实际未出现" + "#{content}" + "请检查原因") if textfields(content).empty?
    end
  end

end

module GestureModule
  #Todo: appium手势操作的参数化封装

  #上滑屏幕的70%
  #swipe(:start_y => 0.8,:delta_y => -0.7,:start_x => 0.9, :delta_x => 0, :duration => 800)
  #滑动屏幕的70%
  def scrollScreen70(direction)
    case direction
      when "Up"
        #底部上滑屏幕的70%
        swipeOpts = {
            :start_y => 0.8,
            :delta_y => -0.7,
            :start_x => 0.9,
            :delta_x => 0,
            :duration => 800
        }
        swipe(swipeOpts)
      when "Down"
        swipeOpts = {
            :start_y => 0.1,
            :delta_y => 0.7,
            :start_x => 0.9,
            :delta_x => 0,
            :duration => 800
        }
        swipe(swipeOpts)
      when "Left"
        swipeOpts = {
            :start_y => 0.9,
            :delta_y => 0,
            :start_x => 0.8,
            :delta_x => -0.7,
            :duration => 800
        }
        swipe(swipeOpts)
      when "Right"
        swipeOpts = {
            :start_y => 0.9,
            :delta_y => 0,
            :start_x => 0.1,
            :delta_x => 0.7,
            :duration => 800
        }
        swipe(swipeOpts)
      else
          puts "Game Over"
    end
  end

  def absoSwipe(ex,ey,eh,ew,direction)
    case direction
      when "Up"
        #底部上滑屏幕的70%
        swipeOpts = {
          :start_y => ey + eh*3/4,
          :delta_y => -eh/2,
          :start_x => ex + ew/2,
          :delta_x => 0,
          :duration => 500
        }
        swipe(swipeOpts)
      when "Down"
        swipeOpts = {
          :start_y => ey + eh/4,
          :delta_y => eh/2,
          :start_x => ex + ew/2,
          :delta_x => 0,
          :duration => 500
        }
        swipe(swipeOpts)
      when "Left"
        swipeOpts = {
          :start_y => ey + eh/2,
          :delta_y => 0,
          :start_x => ex + ew*3/4,
          :delta_x => -ew/2,
          :duration => 500
        }
        swipe(swipeOpts)
      when "Right"
        swipeOpts = {
          :start_y => ey + eh/2,
          :delta_y => 0,
          :start_x => ex + ew/4,
          :delta_x => ew/2,
          :duration => 500
        }
        swipe(swipeOpts)
      else
          puts "Game Over"
    end
  end


end

module OtherModule
  #Todo：其他方法的参数化封装

  #位置信息
  def getposition(element)
    ep = Array[element.location.x,element.location.y,element.size.height,element.size.width]
    return ep
  end

  def specifyLists(content)
    #循环：条件为假时一直执行swip
    swipe(:start_y => 0.8,:delta_y => -0.5,:start_x => 0.9, :delta_x => 0, :duration => 500) until  exists{text(content)}
    puts text(content).text
    text(content).click
  end

  #截屏保存
  def captureScreen(screenshot_name)
    sleep 1
    screenshot("Screenshots/"+ "#{Time.now.to_i}" + "_"+ "#{screenshot_name}"+".png")
    #screenshot("bbb.png")
  end
end

#不建议使用下面的方式处理将上面封装好的module放在类MyAppPage里面
#GitHub上面一个非常不错的示例项目使用下面的方式处理
#1. 将上面定义的Module封装到MyAppPage类中
#2. 在env.rb做如下处理：Appium.promote_appium_methods MyAppPage
#如果采用该种方式处理，存在的问题是：在定义的pages页面，必须使用MyAppPage定义的方法，否则无法定位和操作
#换句话讲，如果采用该种方式处理，appium的方法全部失效(比如find_element)，Page页面中用到的所有appium方法，必须在MyAppPage里面进行重新封装定义才行
#而使用Page页面include这里面定义的module，既可以使用原生方法，也可以使用module定义的方法
=begin
class MyAppPage
  include LocatorModule
  include GestureModule
  include OtherModule
end
=end
