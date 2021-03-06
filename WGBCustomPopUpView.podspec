#
# Be sure to run `pod lib lint WGBCustomPopUpView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WGBCustomPopUpView'
  s.version          = '1.0.2'
  s.summary          = '一个简单通用的弹窗组件,可定制化自定义/各种弹窗样式'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    更新内容：
    1. 支持动画展示过程，展示动画结束以及弹窗移除动画结束的回调
    2. touchDismiss属性的健壮性维护
  DESC

  s.homepage         = 'https://github.com/Wangguibin/WGBCustomPopUpView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wangguibin' => '864562082@qq.com' }
  s.source           = { :git => 'https://github.com/Wangguibin/WGBCustomPopUpView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WGBCustomPopUpView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WGBCustomPopUpView' => ['WGBCustomPopUpView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
