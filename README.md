# multi-protocol-manager
关于实现多重协议的方式，可以实现一对多的代理模式。
因为通知的一对多实现会产生内存泄漏、耦合关系太离散等一系列问题，有了想用代理实现一对多的方式通知。
首先，我们要满足的条件是多处服从协议的类实现代理方法
在触发其中一个代理，及即触发其他同一实现了的代理方法。
即完成了一对多的实现。

![Image text](https://img-blog.csdnimg.cn/20190509141654495.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3NoYW5neTExMA==,size_16,color_FFFFFF,t_70)


其中两个关键点在于
1、协议名称和对象构成的一个键值对，形成1-1对应关系
2、NSPointerArray的使用，使得弱引用对象，且在对象释放时自动删除NSPointerArray中的元素。当然这里也可以使用NSHashTable有一样的效果。

其实这里可以变成多对多的方式，而且在协议名重复也不会混淆。
Demo中包含的例子。
ViewController中代理了TestView中的TestViewDelegate
ButtonView中的TestViewDelegate
SViewController中代理TestView中的TestViewBtnDelegate

ThirdViewController中代理了TestView中的TestViewDelegate
TestView中的TestViewBtnDelegate
所以在点击TestView红色区域时，实现的ViewController和ThirdViewController中的TestViewDelegate的代理方法。
点击蓝色区域实现的是SViewController和ThirdViewController的代理方法。
--------------------- 
作者：shangy110 
来源：CSDN 
原文：https://blog.csdn.net/shangy110/article/details/90032739 
版权声明：本文为博主原创文章，转载请附上博文链接！
