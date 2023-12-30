Pod::Spec.new do |s|
  s.name             = 'OrzUIKit'
  s.version          = '0.0.1'
  s.summary          = 'UIKit write by Swift'
  s.description      = <<-DESC
  UIKit Write by Swift
                       DESC
  s.homepage         = 'https://github.com/OrzGeeker/OrzUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangzhizhou' => '824219521@qq.com' }
  s.source           = { :git => 'https://github.com/OrzGeeker/OrzUIKit.git', :tag => s.version.to_s}
  s.ios.deployment_target = '11.0'
  s.default_subspecs = 'Core'
  s.swift_version = '5.0'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Classes/Core/**/*.swift'
#    ss.exclude_files = 'Classes/Core/Assets/**/*'
    ss.resource_bundles = {
      'OrzUIKit' => ['Classes/Core/Assets/**/*.xcassets']
    }
    ss.dependency 'SnapKit', '~> 5.6.0'

    color_scheme_auto_generated = <<-EOF

    # 代码自动生成脚本
    echo SRCROOT: $PODS_TARGET_SRCROOT

    # 判断资源目录是否存在
    pod_assets_dir="$PODS_TARGET_SRCROOT/Classes/Core/Assets"
    if [ -d $pod_assets_dir ]; then
      echo pod assets dir: $pod_assets_dir
    fi

    # 配色方案自动生成的接口文件
    color_scheme_interface_file_path=$(find $PODS_TARGET_SRCROOT -name 'UIColor+AutoGen.swift')
    if [ -f $color_scheme_interface_file_path ]; then
        echo $color_scheme_interface_file_path
    fi

    # 图片静态成员自动生成接口文件
    image_interface_file_path=$(find $PODS_TARGET_SRCROOT -name 'UIImage+AutoGen.swift')
    if [ -f $image_interface_file_path ]; then
        echo $image_interface_file_path
    fi
    
    # Bundle资源访问
    resource_bundle_file_path=$(find $PODS_TARGET_SRCROOT -name 'Bundle+AutoGen.swift')
    if [ -f $resource_bundle_file_path ]; then
        echo $resource_bundle_file_path
    fi

    # Swift 代码自动生成脚本
    swift_auto_generate_script_file_path="$PODS_TARGET_SRCROOT/scripts/auto_generate.swift"

    # 仅在本地进行组件开发时，脚本目录才会存在，执行代码自动生成脚本
    if [ -f $swift_auto_generate_script_file_path ]; then

      # 调用Swift自动生成脚本
      export pod_assets_dir=$pod_assets_dir
      export color_scheme_interface_file_path=$color_scheme_interface_file_path
      export image_interface_file_path=$image_interface_file_path
      export resource_bundle_file_path=$resource_bundle_file_path
      export resource_bundle_name="OrzUIKit"
      xcrun -sdk macosx /usr/bin/swift $swift_auto_generate_script_file_path
    fi

    EOF

    ss.script_phase = {
      :name => "Auto Generate ColorScheme Interface",
      :script => color_scheme_auto_generated,
      :execution_position => :before_compile
    }
  end

  s.subspec 'Debug' do |ss|
    ss.source_files = 'Classes/Debug/**/*.swift'
    ss.dependency 'OrzUIKit/Core'
  end
 
end
