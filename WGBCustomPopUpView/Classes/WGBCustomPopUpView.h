//
//  WGBCustomPopUpView.h
//  WGBCustomAlertView
////
/**
 *
 *                #####################################################
 *                #                                                   #
 *                #                       _oo0oo_                     #
 *                #                      o8888888o                    #
 *                #                      88" . "88                    #
 *                #                      (| -_- |)                    #
 *                #                      0\  =  /0                    #
 *                #                    ___/`---'\___                  #
 *                #                  .' \\|     |# '.                 #
 *                #                 / \\|||  :  |||# \                #
 *                #                / _||||| -:- |||||- \              #
 *                #               |   | \\\  -  #/ |   |              #
 *                #               | \_|  ''\---/''  |_/ |             #
 *                #               \  .-\__  '-'  ___/-. /             #
 *                #             ___'. .'  /--.--\  `. .'___           #
 *                #          ."" '<  `.___\_<|>_/___.' >' "".         #
 *                #         | | :  `- \`.;`\ _ /`;.`/ - ` : | |       #
 *                #         \  \ `_.   \_ __\ /__ _/   .-` /  /       #
 *                #     =====`-.____`.___ \_____/___.-`___.-'=====    #
 *                #                       `=---='                     #
 *                #     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   #
 *                #                                                   #
 *                #               佛祖保佑         永无BUG              #
 *                #                                                   #
 *                #####################################################
 */

#import <UIKit/UIKit.h>

#ifndef KWIDTH
#define KWIDTH             [UIScreen mainScreen].bounds.size.width
#endif

#ifndef KHIGHT
#define KHIGHT             [UIScreen mainScreen].bounds.size.height
#endif


///动画类型枚举
typedef NS_ENUM(NSInteger,WGBAlertAnimationType) {
    WGBAlertAnimationTypeCenter = 0, //从中心弹出
    WGBAlertAnimationTypeUp ,//从顶部弹出
    WGBAlertAnimationTypeBottom,//从底部弹出
    WGBAlertAnimationTypeLeft,//从左边弹出
    WGBAlertAnimationTypeRight,//从右边弹出
    WGBAlertAnimationTypeAlert //类似系统弹出窗动画
};

@interface UIView (WGBAlertExtra)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@end


@interface WGBCustomPopUpView : UIView

///展示内容的视图view 填充好待展示的内容View
@property (strong,nonatomic) UIView *contentView ;

///`contentView` 必须要在动画类型之前设置 不然无效
@property (assign,nonatomic) WGBAlertAnimationType  animationType;

///动画时长 默认0.25s  default is 0.25 seconds
@property (nonatomic,assign) CGFloat animationDuration;

///是否点击背景移除 默认否 the background layer dismiss. Default is NO
@property (assign,nonatomic) BOOL touchDismiss;

///蒙层的透明度 默认 0.45  maskLayer's backgroundColor alpha, default is 0.45
@property (nonatomic,assign) CGFloat coverMaskAlpha;

///加在哪一个父视图上 指定父视图 传nil 或者 调用`- (void)show`都是默认在`keywindow`上的
- (void)showFromSuperView:(UIView *)superView;

/// 展示到window上
/// show a alert on keywindow
/// 这个方法必须实现,不然看不见任何效果
- (void)show;

///移除弹窗视图 remove alert layer from superView
- (void)dismiss;//消失

///展示动画过程中回调
@property (nonatomic,copy) void(^showAnimationDidStart) (WGBCustomPopUpView *popUpView);
///展示动画执行结束回调
@property (nonatomic,copy) void(^showAnimationDidEnd) (WGBCustomPopUpView *popUpView);
///移除动画过程中 。。。 这是个伪需求 。。。 
///移除动画结束回调
@property (nonatomic,copy) void(^dismissAnimationDidEnd) (WGBCustomPopUpView *popUpView);


@end


@interface WGBAlertViewController : UIViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil __attribute__((unavailable("initWithNibName:bundle:方法不可用,请用 initWithContentViewController:")));

- (instancetype)init __attribute__((unavailable("init方法不可用,请用 initWithContentViewController:")));

/*!
 @method 构造方法
 @property 内容控制器
 @abstract 通过外部传入一个控制器 用于展示
 @discussion 这个控制器是必传的 也就是展示的View放在这个控制器上
 @result 实例化一个弹窗控制器对象
 */
- (instancetype)initWithContentViewController:(UIViewController *)contentViewController;
/*!
 @property
 @abstract 展示内容控制器
 */
@property (nonatomic,strong,readonly) UIViewController *contentViewController;
/*!
 @property
 @abstract 是否需要蒙层 默认NO 其实就是设置传入的控制器的view的背景色(可自定义) 默认是黑色 alpha 0.45
 */
@property (nonatomic,assign) BOOL isMask;

///MARK:- 弹出一个窗
- (void)show;
///MARK:- 消除弹出窗
- (void)dismiss;

@end
