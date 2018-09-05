Pod::Spec.new do |s|
    s.name             = "RxKingfisher"
    s.version          = "1.0.0"
    s.summary          = "Kingfisher的一些扩展 以及Rx支持"
    s.description      = <<-DESC
    Kingfisher的一些扩展 以及Rx支持
    DESC
    s.homepage         = "https://github.com/Z-JaDe/RxKingfisher"
    s.license          = 'MIT'
    s.author           = { "ZJaDe" => "zjade@outlook.com" }
    s.source           = { :git => "https://github.com/Z-JaDe.git", :tag => s.version.to_s }
    
    s.requires_arc          = true
    
    s.ios.deployment_target = '8.0'
    
    s.default_subspec = "RxSwift"

    s.subspec "Core" do |ss|
        ss.source_files  = "Sources/Core/**/*.{swift}"
        
        ss.framework  = "Foundation"
         ss.dependency "Kingfisher"
    end

    s.subspec "RxSwift" do |ss|
        ss.source_files  = "Sources/RxSwift/**/*.{swift}"

        ss.framework  = "Foundation"
        ss.dependency "RxKingfisher/Core"
    end

end
