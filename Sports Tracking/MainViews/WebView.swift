import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.preferences = WKPreferences()
        configuration.preferences.minimumFontSize = 14
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = false
        configuration.allowsInlineMediaPlayback = true
        configuration.selectionGranularity = .dynamic
        
        let webView = WKWebView(frame: .zero, configuration: configuration) 
        webView.scrollView.isScrollEnabled = true
        webView.allowsBackForwardNavigationGestures = false
        webView.allowsLinkPreview = false
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let urlValue = url, let requestUrl = URL(string: urlValue) {
            webView.load(URLRequest(url: requestUrl))
        }
    }
}
