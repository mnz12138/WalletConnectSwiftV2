import Foundation
import XCTest

struct RoutingEngine {
    
    private var springboard: XCUIApplication {
        return App.springboard.instance
    }

    func launch(app: App, clean: Bool) {
        app.instance.terminate()

        if clean {
            let app = app.instance
            app.launchArguments = ["-cleanInstall"]
            app.launch()
        } else {
            let app = app.instance
            app.launch()
        }
    }
    
    func activate(app: App) {
        app.instance.activate()
        app.instance.waitForAppearence()
    }
    
    func home() {
        XCUIDevice.shared.press(.home)
    }
    
    func wait(for interval: TimeInterval) {
        Thread.sleep(forTimeInterval: interval)
    }
}
