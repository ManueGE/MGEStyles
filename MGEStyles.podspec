Pod::Spec.new do |s|
  s.name             = "MGEStyles"
  s.version          = "1.0.0"
  s.summary          = "An easy way to customize styles to any UIResponder from the Interface Builder"
  s.description      = <<-DESC
                       Customize the appearance and any other property of any UIResponder (views, view controllers, labels, buttons)
                       just by setting a style string in the Interface Builder.
                       DESC
  s.homepage         = "https://github.com/ManueGE/MGEStyles"
  s.license          = 'Apache License'
  s.author           = { "ManueGE" => "manuel@softopusgarden.com" }
  s.source           = { :git => "https://github.com/ManueGE/MGEStyles.git", :tag => "1.0.0" }
  s.social_media_url = 'https://twitter.com/ManueGE'

  s.platform     = :ios,  '6.0'
  s.requires_arc = true

  s.source_files = 'MGEStyles/MGEStyles/**/*'
  s.resource_bundles = {
  }

  s.public_header_files = 'MGEStyles/MGEStyles/*.h'
  s.frameworks = 'UIKit'

  s.subspec 'Lite' do |lite|
    lite.source_files = 'MGEStyles/MGEStyles/MGEStylesLite/*'
  end

end