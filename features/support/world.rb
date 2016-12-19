#World可以看做是Cucumber在运行每个场景之前所要创建的对象的实例
#不仅每一个Step Definition可以调用该实例的方法，而且该项目定义的Ruby类也可以调用该实例的方法
#world在features-support目录下定义
#下面是一个World的示例
=begin
module MyModule
  #实例方法
  def self.foo(name)
    puts "MyModule_FOO: #{name} "
  end

  #类方法
  def boo(key)
    puts "MyModule_BOO: #{key}!"
  end
end
World(MyModule)
=end
