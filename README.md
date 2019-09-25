# WGBCustomPopUpView

<p align='center'>
<img src="https://img.shields.io/badge/build-passing-brightgreen.svg">
<a href="https://cocoapods.org/pods/WGBCustomPopUpView"> <img src="https://img.shields.io/cocoapods/v/WGBCustomPopUpView.svg?style=flat"> </a>
<img src="https://img.shields.io/badge/platform-iOS-ff69b4.svg">
<img src="https://img.shields.io/badge/language-Objective--C-orange.svg">
<a href=""><img src="https://img.shields.io/badge/license-MIT-000000.svg"></a>
<a href="http://wangguibin.github.io"><img src="https://img.shields.io/badge/Blog-CoderWGB-80d4f9.svg?style=flat"></a>
<img src="https://img.shields.io/badge/Enjoy-it%20!-brightgreen.svg?colorA=a0cd34">
</p>

## Example
**图片仅供参考,具体还是看代码比较好**
`pic is cheap , show the code `

![1](./ExampleImages/1.png) 

![2](./ExampleImages/2.png) 

![3](./ExampleImages/3.png) 

![4](./ExampleImages/4.png) 

![5](./ExampleImages/5.png) 

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```objc

//实例化	
  	WGBCustomPopUpView *popUpView = [[WGBCustomPopUpView alloc] init];
  	
	UIView *bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	bgView.userInteractionEnabled = YES;
	bgView.backgroundColor = [UIColor clearColor] ;

  	UIView *redView = [[UIView alloc] init];
  	redView.frame = CGRectMake(0,kScreenHeight-200,375,200);
  	redView.backgroundColor =[UIColor redColor];
	redView.center = CGPointMake(bgView.frame.size.width/2, bgView.frame.size.height/2);
	[bgView addSubview: redView];


	/// 以下三行才是关键代码 
  	popUpView.contentView = redView;  //设置内容视图
  	popUpView.animationType = arc4random()%6;  //设置弹窗动画类型  随机枚举值  
  	[popUpView show]; // 弹出来瞧瞧

  	// 必要的时候消除弹窗
  		popUpView.touchDismiss = YES;
  		[popUpView dismiss];

```

## Requirements

## Installation

WGBCustomPopUpView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WGBCustomPopUpView',‘~>1.0.0’
```

## Author

Wangguibin, 864562082@qq.com

## License

WGBCustomPopUpView is available under the MIT license. See the LICENSE file for more info.
