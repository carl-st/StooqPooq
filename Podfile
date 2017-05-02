# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

target 'StooqPooq' do
  use_frameworks!

  # Pods for Regease
  pod 'Realm', :git => 'https://github.com/realm/realm-cocoa.git', :branch => 'master', submodules: true
  pod 'RealmSwift', :git => 'https://github.com/realm/realm-cocoa.git', :branch => 'master', submodules: true
  pod 'ObjectMapper', '~> 2.2'
  pod 'Fuzi', '~> 1.0.0'

  target 'StooqPooqTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'StooqPooqUITests' do
    inherit! :search_paths
    # Pods for testing
  end


  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.1'
      end
    end
  end
end
