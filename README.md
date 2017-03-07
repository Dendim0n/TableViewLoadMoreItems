TableView多种分批加载方式的简易Demo
===
Simple Demo of UITableView to Load More Items.
-----
##具体加载方式：

* 载入到当前最后一个Item的时候，自动加载后续Items
* 在最后追加一个Item，显示“点击显示更多”，点击加载后续Items
* 设置一个显示“点击显示更多”的Footer，点击加载后续Items

实现方式大同小异，主要需要注意的就是`insertRows`方法需要在主线程调用。

Enjoy~