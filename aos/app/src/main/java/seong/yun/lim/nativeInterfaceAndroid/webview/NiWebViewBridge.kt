package seong.yun.lim.nativeInterfaceAndroid.webview

import android.os.Handler
import android.os.Looper
import android.util.Log
import android.webkit.JavascriptInterface
import android.webkit.WebView

class NiWebViewBridge {
    val webview: WebView;
    constructor(webView: WebView){
        this.webview = webView;
    }
    private val TAG = "NiWebViewBridge"
    val handler = Handler(Looper.getMainLooper());
    @JavascriptInterface
    fun test(){
        Log.d(TAG, "test: ")
        handler.post {
            webview.loadUrl("javascript:test(\"${2}\")")
        }
    }
}