Pod::Spec.new do |s|
    s.name             = "Rx+Kingfisher"
    s.version          = "1.0.0"
    s.summary          = "Kingfisher的一些扩展 以及Rx支持"
    s.description      = <<-DESC
    Kingfisher的一些扩展 链式写法
    Rx 下载图片后做一些处理
    DESC
    s.homepage         = "https://github.com/Z-JaDe"
    s.license          = 'MIT'
    s.author           = { "ZJaDe" => "zjade@outlook.com" }
    s.source           = { :git => "https://github.com/Z-JaDe/RxKingfisher.git", :tag => s.version.to_s }
    
    s.requires_arc          = true
    
    s.ios.deployment_target = '8.0'
    s.frameworks  = "Foundation"
    s.swift_version = "4.2"
    
    s.default_subspec = "RxSwift"

    s.subspec "Core" do |ss|
        ss.source_files  = "Sources/Core/**/*.{swift}"
        
        ss.dependency "Kingfisher", '~> 4'
    end

    s.subspec "RxSwift" do |ss|
        ss.source_files  = "Sources/RxSwift/**/*.{swift}"

        ss.dependency "RxSwift", '~> 4'
        ss.dependency "Rx+Kingfisher/Core"
    end

end