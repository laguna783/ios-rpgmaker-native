//
// RPG Maker MZ Export Framework for iOS (Xcode 12)

// Wiz Arts Digital, 2021

// Created by Giancarlos Alvarado on 1/24/21.

// Original Resource Link: https://forums.rpgmakerweb.com/index.php?threads/ios-app-creation-tutorial-for-mz-mv-xcode-12.128674/


import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    var webView: WKWebView!

    // This gets called when loading the WKWebView
    override func loadView() {
        super.loadView()
   
        webView = WKWebView()
   
        let webViewConfig = WKWebViewConfiguration()
        webViewConfig.dataDetectorTypes = []
        webViewConfig.allowsInlineMediaPlayback = true
        webViewConfig.mediaTypesRequiringUserActionForPlayback = []
        webView = WKWebView(frame: view.frame, configuration: webViewConfig)
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
   
    }

    // Called after the WebView was created
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let htmlPath = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "www")!
        
        //"www" is the folder name of your project. If your RPG Maker MZ folder has a different name, change "www" to the name of your output folder.
        
        webView.loadFileURL(htmlPath, allowingReadAccessTo: htmlPath)
   
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
    }
   
    // This is to allow JavaScript Alert() for debugging
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        // alert
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler()
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
