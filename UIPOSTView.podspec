

Pod::Spec.new do |s|
  s.name             = 'UIPOSTView'
  s.version          = '1.0.2'
  s.summary          = '輕量的提交留言、回覆視圖控制器'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/League2EB/UIPOSTView'
  s.screenshots      = 'https://i.imgur.com/LzKtwn9.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'League2EB' => 'poloa51404@gmail.com' }
  s.source           = { :git => 'https://github.com/League2EB/UIPOSTView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://league2eb.github.io/'
  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'UIPOSTView/Classes/**/*'
  
  s.resource_bundles = {
   'UIPOSTViewResource' => ['UIPOSTView/Assets/*.{png,xib,xcassets}']
  }

end
