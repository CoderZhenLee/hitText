# hitText
 ![](http://img.blog.csdn.net/20160520220942154)
**hitText作用:**  当在一个屏幕上添加一个屏幕罩，但又不影响下面 view 的操作时，也就是透过屏幕罩对下面的 view 进行操作。

举例说明：(陌陌面试题)

问题描述：将 UIScrollView 和 UIView 都添加到 Controller 的 view 上，可以拖动 UIView， UIScrollView 也可以滚动。
![示例图](http://upload-images.jianshu.io/upload_images/2370110-39fdaa46cc89692b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

调用过程：
> iOS系统检测到手指触摸(Touch)操作时会将其放入当前活动Application的事件队列，[UIApplication](http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIApplication_Class/)会从事件队列中取出触摸事件并传递给key window(当前接收用户事件的窗口)处理,window对象首先会使用`hitTest:withEvent:`方法寻找此次Touch操作初始点所在的视图(View),即需要将触摸事件传递给其处理的视图,称之为hit-test view。
window对象会在首先在view hierarchy的顶级view上调用[hitTest:withEvent:](http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/instm/UIView/hitTest:withEvent:)，此方法会在视图层级结构中的每个视图上调用[pointInside:withEvent:](http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/instm/UIView/pointInside:withEvent:),如果`pointInside:withEvent:`返回YES,则继续逐级调用，直到找到touch操作发生的位置，这个视图也就是hit-test view。


hitText:withEvent:调用方法处理流程：

> 1. 首先调用当前视图的`pointInside:withEvent:`方法判断触摸点是否在当前视图内；
2. 若返回NO,则`hitTest:withEvent:`返回nil;
3. 若返回YES,则向当前视图的所有子视图(subviews)发送`hitTest:withEvent:`消息，所有子视图的遍历顺序是从top到bottom，即从subviews数组的末尾向前遍历,直到有子视图返回非空对象或者全部子视图遍历完毕；
4. 若第一次有子视图返回非空对象,则`hitTest:withEvent:`方法返回此对象，处理结束；
5. 如所有子视图都返回非，则`hitTest:withEvent:`方法返回自身 self 。

主要代码：
````
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //1.判断下自己能否接收事件
    if (self.alpha <= 0.01) {
        return nil;
    }

    //2.判断是否在当前区域内点击
    if ([self pointInside:point withEvent:event] == NO) {
        return nil;
    }
    else
    {
        //3.把当前坐标系上的点转换成父视图上的点
        CGPoint newPoint  = [self convertPoint:point toView:self.superview];
        
        //4.获取想要响应的 view
        UIView *view = self.superview.subviews[0];
        
        if (CGRectContainsPoint(view.frame, newPoint)) {
            return view;
        }
        else
        {
            //如果没有比自己合适的子控件，最适合的 View 就是自己
            return self;
        }
    }
}
````
