platform :ios, '11.0'

def install_oneSignalPod
	pod 'OneSignal', '>= 2.11.2', '< 3.0'
end

target 'Base-Project' do
  # Pods for Base-Project
  use_frameworks!
  	pod 'R.swift'
  	pod 'CZPicker'
  	pod 'SDWebImage', '~> 5.0'
  	pod 'SwiftLocation'
	pod 'Logging', '~> 1.1'	
	pod 'TDPopupKit'
	install_oneSignalPod
end


target 'OneSignalNotificationServiceExtension' do
  use_frameworks!
    	install_oneSignalPod
end


target 'Base-ProjectTests' do
  use_frameworks!

end

target 'AnalyticsManager' do
  use_frameworks!
  	pod 'Firebase/Analytics'
	pod 'Firebase/Crashlytics'
end

post_install do |installer|
  	installer.pods_project.targets.each do |target|
	    target.build_configurations.each do |config|
	      config.build_settings['SWIFT_VERSION'] = '5.0'
	    end
	 end
	remove_duplicate_dependencies(installer)
end

#### This to remove Duplicate frameworks

def remove_duplicate_dependencies(installer)
    
    applicationTargets = [
        'Pods-Base-Project',
    ]
    libraryTargets = [
        'Pods-AnalyticsManager',
    ]

    embedded_targets = installer.aggregate_targets.select { |aggregate_target|
        libraryTargets.include? aggregate_target.name
    }
    embedded_pod_targets = embedded_targets.flat_map { |embedded_target| embedded_target.pod_targets }
    host_targets = installer.aggregate_targets.select { |aggregate_target|
        applicationTargets.include? aggregate_target.name
    }

    # We only want to remove pods from Application targets, not libraries
    host_targets.each do |host_target|
        host_target.xcconfigs.each do |config_name, config_file|
            host_target.pod_targets.each do |pod_target|
                if embedded_pod_targets.include? pod_target
                    pod_target.specs.each do |spec|
                        if spec.attributes_hash['ios'] != nil
                            frameworkPaths = spec.attributes_hash['ios']['vendored_frameworks']
                            else
                            frameworkPaths = spec.attributes_hash['vendored_frameworks']
                        end
                        if frameworkPaths != nil
                            frameworkNames = Array(frameworkPaths).map(&:to_s).map do |filename|
                                extension = File.extname filename
                                File.basename filename, extension
                            end
                            frameworkNames.each do |name|
                                puts "Removing #{name} from OTHER_LDFLAGS of target #{host_target.name}"
                                config_file.frameworks.delete(name)
                            end
                        end
                    end
                end
            end
            xcconfig_path = host_target.xcconfig_path(config_name)
            config_file.save_as(xcconfig_path)
        end
    end

end
