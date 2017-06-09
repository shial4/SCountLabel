Pod::Spec.new do |s|
  s.name         = "SCountLabel"
  s.version      = "0.0.1"
  s.summary      = "Swift counting label."
  s.description  = <<-DESC
    SCountLabel is an easy way to make your UIKit label count from one value to second!
  DESC
  s.homepage     = "https://github.com/shial4/SCountLabel.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Szymon Lorenz" => "shial184686@gmail.com" }
  s.social_media_url   = "https://twitter.com/shial_4"
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/shial4/SCountLabel.git", :tag => s.version.to_s }
  s.source_files  = "Sources/SCountLabel.swift"
  s.frameworks  = "UIKit"
end