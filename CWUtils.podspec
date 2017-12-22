Pod::Spec.new do |s|
  s.name         = "CWUtils"
  s.version      = "0.3.0"
  s.summary      = "iOS 어플리케이션 개발용 유틸리티 모음"
  s.description  = "RxSwift 를 기반으로 하고 있음. (Dependancy : RxSwift, RxCocoa, RxOptional)"

  s.homepage     = "https://github.com/iamchiwon/CWUtils"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "iamchiwon" => "iamchiwon@gmail.com" }
  
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/iamchiwon/CWUtils.git", :tag => "#{s.version}" }
  s.source_files = "CWUtils", "CWUtils/**/*.swift"

  s.dependency "RxSwift"
  s.dependency "RxCocoa"
  s.dependency "RxOptional"

end
