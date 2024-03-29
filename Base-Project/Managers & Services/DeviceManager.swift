import UIKit
import Foundation
import DeviceKit
import AudioToolbox

class DeviceManager {
    private init() {}

    static let current =  DeviceManager()
    
    /// Returns if this device is an iPHONE. real or simulator.
    var isiPhone  : Bool {
        
        return Device.current.isPhone
    }
    /// Returns if the device is a real iPhone
    var isRealiPhone : Bool {
        return Device.current.isPhone && !Device.current.isSimulator
    }
    
    /// Returns true is this device is an iPad. Real or Simulator
    var iPad : Bool {
        return Device.current.isPad
    }
    /// Returns if the device is a real iPad
    var isRealiPad : Bool {
        return Device.current.isPad && !Device.current.isSimulator
    }
    
    /// Returns true is app is running on a Simulator
    var isSimulator: Bool {
        return Device.current.isSimulator
    }
    
    /// Returns true if app is running on an X-Series Device. iPhoneX iPhoneXs iPhoneXsMax iPhoneXr]
    var isXSeries : Bool{
        return Device.current.realDevice.isOneOf(Device.allXSeriesDevices)
    }
    /// Returns true if app is running on Real X-Series Device. iPhoneX iPhoneXs iPhoneXsMax iPhoneXr]
    var isRealXSeries : Bool {
        return Device.current.isOneOf(Device.allXSeriesDevices)
    }
    
    /// Returns true if app is running on any iPhone plus Device. iPhone 8-Plus iPhone 7-Plus iPhone 6s-Plus iPhone 6-Plus
    var isPlusSized : Bool{
        return Device.current.realDevice.isOneOf(Device.allPlusSizedDevices)
    }
    
    /// Returns true if device has FaceID or TouchID
    var hasBiometricScanner : Bool {
        return Device.current.realDevice.hasBiometricSensor
    }
    /// Returns the name of the device. For example : 'Wassim's iPhone X', 'Hadi's iPhone'
    var deviceName : String {
        
        return Device.current.name ?? "No Name"
    }
    /// Returns the iOS version as string. (e.g. 8.4 or 9.2).
    var iOSVersion : String {
        return Device.current.systemVersion ?? "No iOS"
    }
    /// Returns the screen brightness of the device
    var screenBrightness : Int {
        return Device.current.screenBrightness
    }
    /// Returns if the current device is charging
    var isCharging : Bool {
        guard let state = Device.current.batteryState else {
            return false
        }
        switch state {
        case .charging(_):
            return true
        default:
            return false
        }
        
    }
    /// Returns true if the battery is full
    var isBatteryFull : Bool{
        return Device.current.batteryState == .full
    }
    /// Return true if the phone is not plugged to power
    var isUnPlugged : Bool {
        guard let state = Device.current.batteryState else {
            return false
        }
        switch state {
        case .charging(_):
            return true
        default:
            return false
        }
    }
    /// Returns the battery level of the device
    var batteryLevel : Int {
        return Device.current.batteryLevel ?? 0
    }
    /// returns true if device is low power mode
    var isLowPowerModeEnabled : Bool {
        guard let state = Device.current.batteryState else {
            return false
        }
        return state.lowPowerMode
    }
    /// returns that status bar height of the device
    var statusBarHeight : CGFloat {
        return UIApplication.shared.statusBarFrame.height
        
    }
    
    func vibrateDevice(completionHandler : ( () -> Void )?){
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) {
            completionHandler?()
        }
    }
    
    
    /// Generate notification feedback to communicate that a task or action has succeeded, failed, or produced a warning of some kind..
    ///
    /// - Parameter type: Types of haptic notification
    func generateHaptic(type : NotificationHaptic){
        guard let value = type.value else {
            return
        }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(value)
    }
    
    /// Generate impact feedback to indicate that an impact has occurred.
    /// For example, you might trigger impact feedback when a user interface object collides with another object or snaps into place.
    ///
    /// - Parameter style: Physical impacts haptic style.
    func generateImpact(style : ImpactFeedback){
        guard let value = style.value else {
            return
        }
        let generator = UIImpactFeedbackGenerator(style: value)
        generator.impactOccurred()
    }
    
    
    /// Genereate haptics to indicate a change in selection.
    func generateSelectionFeedback(){
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}
