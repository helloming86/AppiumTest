#公共Module，页面需要时使用include引用

module LocatorModule
  #Todo: appium方法的参数化封装，主要封装定位方法和检查点

  #Text，对应android.widget.TextView
  #定义不存在的检查点，存在时报错
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

end

module OtherModule
  #Todo：其他方法的参数化封装

  #截屏保存
  def captureScreen(screenshot_name)
    sleep 1
    screenshot("Screenshots/"+ "#{Time.now.to_i}" + "_"+ "#{screenshot_name}"+".png")
    #screenshot("bbb.png")
  end
end

#不使用下面的方式处理这些封装的module
#网上，使用下面的方式处理，并在env.rb做如下的处理：
#Appium.promote_appium_methods MyAppPage
#存在的问题是，如果采用该种方式处理：在定义的pages页面，必须使用MyAppPage定义的方法，appium方法全部失效了
#换句话讲，如果采用该种方式处理，所有用到的appium方法全部需要重写后才可以使用
=begin
class MyAppPage
  include LocatorModule
  include GestureModule
  include OtherModule
end
=end
