

Pod::Spec.new do |s|

    s.name         = "ZJDTimer"
    s.version      = "1.0.2"

    s.description  = <<-DESC
                    简单实用的计时器
                    DESC

    s.ios.deployment_target = '7.0'
    s.summary      = "简单实用的计时器"
    s.homepage     = "https://github.com/Sdfeidong/ZJDTimer"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "Sdfeidong" => "zh75701.aidong@qq.com" }
    s.source       = { :git => "https://github.com/Sdfeidong/ZJDTimer.git", :tag => s.version }
    s.source_files  = "ZJDTimer/*.{h,m}"
    s.source_files  = "ZJDTimer/**/*.{h,m}"
    s.requires_arc = true

end