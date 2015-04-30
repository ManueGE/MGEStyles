#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MGEStyles"
  s.version          = "0.9.0"
  s.summary          = "An easy way to customize styles to any UIResponder from the Interface Builder"
  s.description      = <<-DESC
                       Customize the appearance and any other property of any UIResponder (views, view controllers, labels, buttons)
                       just by setting a style string in the Interface Builder.
                       DESC
  s.homepage         = "https://github.com/ManueGE/MGEStyles"
  s.license          = 'Apache License'
  s.author           = { "ManueGE" => "manuel@softopusgarden.com" }
  s.source           = { :git => "https://github.com/ManueGE/MGEStyles.git", :tag => "0.9.0" }
  s.social_media_url = 'https://twitter.com/ManueGE'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'MGEStyles/MGEStyles/*'
  s.resource_bundles = {
  }

  s.public_header_files = 'MGEStyles/MGEStyles/*.h'
  s.frameworks = 'UIKit'
end