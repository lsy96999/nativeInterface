package seong.yun.lim.nativeInterfaceAndroid

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import seong.yun.lim.nativeInterfaceAndroid.webview.NIWebViewActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<Button>(R.id.goWebView).setOnClickListener {
            startActivity(Intent(this, NIWebViewActivity::class.java))
        }
    }
}