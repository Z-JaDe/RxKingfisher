source 'https://github.com/CocoaPods/Specs.git'



platform :ios, '9.0'
use_frameworks!
#Framework

install! 'cocoapods', :deterministic_uuids => false

abstract_target 'CommonPods' do
    
    pod 'RxSwift', :git => 'https://github.com/ReactiveX/RxSwift'
    
    pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher'

    target:RxKingfisher do

    end
end




#post_install do |installer|
#  installer.pods_project.targets.each do |target|
#    target.build_configurations.each do |config|
#      config.build_settings['SWIFT_VERSION'] = '4.0'
#      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
#    end
#  end
#end
