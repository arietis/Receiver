source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

project 'Receiver.xcodeproj'

inhibit_all_warnings!
use_frameworks!

def pods

end

target 'Receiver' do
  pods
end

def testing_pods
  pods
  pod 'Nimble', '~> 7.0'
  pod 'Quick', '~> 1.2'
end

target 'ReceiverTests' do
  testing_pods
end

target 'ReceiverUITests' do
  testing_pods
end
