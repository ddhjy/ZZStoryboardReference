#
# Be sure to run `pod lib lint ZZStoryboardReference.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZZStoryboardReference'
  s.version          = '0.1.0'
  s.summary          = 'A convenient way to Instantiate view controller from storyboard.'
  s.homepage         = 'https://github.com/ddhjy/ZZStoryboardReference'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ddhjy' => '510893492@qq.com' }
  s.source           = { :git => 'https://github.com/ddhjy/ZZStoryboardReference.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZZStoryboardReference/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZZStoryboardReference' => ['ZZStoryboardReference/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
