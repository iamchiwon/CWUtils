Pod::Spec.new do |s|
  s.name         = "CWUtils"
  s.version      = "0.15.2"
  s.summary      = "iOS 어플리케이션 개발용 유틸리티 모음"
  s.description  = "RxSwift 를 기반으로 하고 있음. (Dependancy : RxSwift, RxCocoa, RxOptional)"

  s.homepage     = "https://github.com/iamchiwon/CWUtils"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "iamchiwon" => "iamchiwon@gmail.com" }
  
  s.swift_versions        = '5'
  s.ios.deployment_target = '10.0'
  s.source       = { :git => "https://github.com/iamchiwon/CWUtils.git", :tag => s.version.to_s }
  s.source_files = "CWUtils/Classes/**/*"

  # s.resource_bundles = {
  #   'CWUtils' => ['CWUtils/Assets/*.png']
  # }

  s.dependency "RxSwift"
  s.dependency "RxCocoa"
  s.dependency "RxSwiftExt"
  s.dependency "RxOptional"
  s.dependency "RxViewController"
  s.dependency "SnapKit"
  s.dependency "Reusable"
  s.dependency "Then"
  s.dependency "Kingfisher"

end
