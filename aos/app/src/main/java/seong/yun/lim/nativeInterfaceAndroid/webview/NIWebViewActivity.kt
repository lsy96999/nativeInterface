package seong.yun.lim.nativeInterfaceAndroid.webview

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import seong.yun.lim.nativeInterfaceAndroid.R

class NIWebViewActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_niweb_view)
        val webView = findViewById<WebView>(R.id.webView)
        WebView.setWebContentsDebuggingEnabled(true)
        webView.apply {
            webViewClient = WebViewClient()
            webChromeClient = WebChromeClient()
            settings.userAgentString = settings.userAgentString+" NiAos"
            settings.javaScriptEnabled = true
            addJavascriptInterface(NiWebViewBridge(webView), "NiAos")
            loadUrl("https://www.google.com")
        }
    }
}