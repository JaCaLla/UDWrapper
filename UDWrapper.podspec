#
# Be sure to run `pod lib lint UDWrapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UDWrapper'
  s.version          = '0.1.2'
  s.summary          = 'UDWrapper is a User Defaults wrapper but ciphers content with a random installation key'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'UDWrapper offers another degree of security to UserDetault store data, because data stored in it will not be visisble on extracting de app from device'


  s.homepage         = 'https://github.com/JaCaLla/UDWrapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Javier Calatrava Llaveria' => 'javi.calatrava@gmail.com' }
  s.source           = { :git => 'https://github.com/JaCaLla/UDWrapper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'

  s.source_files = 'UDWrapper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UDWrapper' => ['UDWrapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'CryptoSwift'
   s.dependency 'SwiftKeychainWrapper', '~> 3.0.1'
end
