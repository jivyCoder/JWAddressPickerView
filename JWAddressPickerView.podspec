
Pod::Spec.new do |s|
s.name         = "JWAddressPickerView"
s.version      = "0.0.1"
s.ios.deployment_target = '8.0'
s.summary      = "封装好的地址选择器"
s.description  = "不引入任何第三方框架,使用类方法调用,方便快捷"
s.homepage     = "https://github.com/jivyCoder/JWAddressPickerView"
s.license      = "MIT"
s.author       = "jivyCoder"
s.source       = { :git => "https://github.com/jivyCoder/JWAddressPickerView.git", :tag => "#{s.version}" }
s.source_files = "JWAddressPickerView/*.{h,m}"
s.requires_arc = true
end
