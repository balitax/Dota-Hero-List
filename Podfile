platform :ios, '11.0'

target 'DotaHeroes' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DotaHeroes

  pod 'RxSwift'
  pod 'Alamofire'
  pod 'RealmSwift'
  pod "Kingfisher"

  target 'DotaHeroesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DotaHeroesUITests' do
    # Pods for testing
  end

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.1'
    end
  end
end
