#
# Be sure to run `pod lib lint IDAdSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IDAdSDK'
  s.version          = '0.1.12'
  s.summary          = 'IDAdSDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'IDAdSDK 自用SDK IDAdSDK 自用SDK'

  s.homepage         = 'http://www.seblong.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangwei' => 'wangwei@seblong.com' }
  s.source           = { :git => 'https://github.com/liumaos/IDAdSDK.git', :tag => s.version.to_s }

  s.platform         = :ios, '9.0'
  s.static_framework      = true
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  s.source_files = 'IDAdSDK/Classes/**/*'

  s.vendored_frameworks  = 'KSAdSDK/KSAdSDK.framework'
  s.frameworks  = 'UIKit','MobileCoreServices','CoreGraphics','Security','SystemConfiguration','CoreTelephony','AdSupport','CoreData','StoreKit','AVFoundation','MediaPlayer','CoreMedia','WebKit','Accelerate','CoreLocation','AVKit','MessageUI','QuickLook','AddressBook'
  
  s.libraries   = 'resolv.9','z','sqlite3','c++','c++abi'
  
  # s.resource_bundles = {
  #   'IDAdSDK' => ['IDAdSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   #s.dependency 'KSAdSDK','3.0.0.2'
   s.dependency 'GDTMobSDK'
   s.dependency 'Ads-CN'
   s.dependency 'Masonry'
   s.dependency 'SDWebImage'

end
