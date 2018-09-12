
Pod::Spec.new do |s|
  s.name         = "LoginPodTest"
  s.version      = "1.0.2"
  s.summary      = "LoginPodTest for ios"
s.description  = <<-DESC
It is a component for ios photo browser,written by Objective-C.
DESC
  s.homepage     = "https://github.com/zhuguojun0022/rsyx/tree/master/EPSecuritySDKDemo/LoginPodTest"
  s.license      = "MIT"

  s.author       = { "zhuguojun" => "zhugj@epsoft.com.cn" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/zhuguojun0022/rsyx.git", :tag => s.version }

  s.source_files  = "EPSecuritySDKDemo/LoginPodTest/*.{h,m}"
  s.requires_arc = true

end
