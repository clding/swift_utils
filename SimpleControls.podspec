#
#  Be sure to run `pod spec lint SimpleControls.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SimpleControls"
  spec.version      = "0.1.6"
  spec.summary      = "some simple control utils"

  # spec.description  = <<-DESC
  #                 DESC

  spec.homepage     = "https://github.com/clding/swift_utils.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "clding" => "mydchl@163.com" }
  # Or just: spec.author    = "clding"
  # spec.authors            = { "clding" => "mydchl@163.com" }
  # spec.social_media_url   = "https://twitter.com/clding"

  # spec.platform     = :ios
  spec.platform     = :ios, "11.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "11.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  spec.source       = { :git => "https://github.com/clding/swift_utils.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "CommonUiUtils/Classes/**/*.{swift, xib}"
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  spec.resources = "CommonUiUtils/Classes/**/*.{xib, png}"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  spec.requires_arc = true
  spec.swift_version = "5.1"

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  spec.dependency "SnapKit"

end
