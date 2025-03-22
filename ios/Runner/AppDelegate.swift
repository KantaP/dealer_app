import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  var overlayView: UIView?
  var blurEffectView: UIVisualEffectView?


  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
   
    NotificationCenter.default.addObserver(self,
                                               selector: #selector(applyBlurEffect),
                                               name: UIApplication.userDidTakeScreenshotNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(checkScreenRecording),
                                               name: UIScreen.capturedDidChangeNotification,
                                               object: nil)
  
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(appWillResignActive),
      name: UIApplication.willResignActiveNotification,
      object: nil
    )
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(appDidBecomeActive),
      name: UIApplication.didBecomeActiveNotification,
      object: nil
    )
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @objc func appWillResignActive() {
    // Show the blur overlay when the app becomes inactive
    showOverlay()
  }

  @objc func appDidBecomeActive() {
     if UIScreen.main.isCaptured {
          applyBlurEffect() // Apply blur if screen is being recorded
      } else {
          removeOverlay()
      }
    // Remove the blur overlay when the app becomes active
   
  }


  func showBlurOverlay() {
    guard overlayView == nil else { return }  // Avoid adding multiple overlays

    // Create a blur effect
    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = UIScreen.main.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    // Add the blur view to the main window
    if let window = UIApplication.shared.windows.first {
      window.addSubview(blurEffectView)
      overlayView = blurEffectView
    }
  }

  func showSolidOverlay() {
    guard overlayView == nil else { return }  // Avoid adding multiple overlays

    // Create a solid color overlay
    let solidView = UIView(frame: UIScreen.main.bounds)
    solidView.backgroundColor = UIColor.black.withAlphaComponent(0.8)  // Adjust opacity if needed
    solidView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    // Add the solid color overlay to the main window
    if let window = UIApplication.shared.windows.first {
      window.addSubview(solidView)
      overlayView = solidView
    }
  }

  func removeOverlay() {
    // Remove the overlay from the window
    overlayView?.removeFromSuperview()
    overlayView = nil
  }

  func showOverlay() {
    // Use either a blurred or solid overlay here
    showBlurOverlay()   // Or use `showSolidOverlay()` if you prefer a solid color
  }

  // Apply a blur effect when a screenshot is detected
    @objc func applyBlurEffect() {
        if let window = window {
            let blurEffect = UIBlurEffect(style: .light)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView?.frame = window.bounds
            blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            window.addSubview(blurEffectView!)
            
            // Optionally remove the blur after a few seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.blurEffectView?.removeFromSuperview()
            }
        }
    }
    
    // Check if screen recording has started and apply blur
    @objc func checkScreenRecording() {
        if UIScreen.main.isCaptured {
            applyBlurEffect() // Apply blur if screen is being recorded
        }
    }

    // Remove the observers when the app is deinitialized
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}