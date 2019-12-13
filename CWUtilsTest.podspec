Pod::Spec.new do |s|
  s.name         = "CWUtilsTest"
  s.version      = "1.0.0"
  s.summary      = "iOS 어플리케이션 개발용 유틸리티 모음"
  s.description  = "RxSwift 를 기반으로 하고 있음. (Dependancy : RxSwift, RxCocoa, RxOptional)"

  s.homepage     = "https://github.com/iamchiwon/CWUtils"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "iamchiwon" => "iamchiwon@gmail.com" }
  
  s.swift_versions        = '5'
  s.ios.deployment_target = '10.0'
  s.source       = { :git => "https://github.com/iamchiwon/CWUtils.git", :tag => s.version.to_s }
  s.source_files = "CWUtils/Test/**/*"
  s.framework = 'XCTest'

end
