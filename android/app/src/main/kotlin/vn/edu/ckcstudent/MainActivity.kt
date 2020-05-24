package vn.edu.ckcstudent

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    private val webViewChannel = "vn.edu.ckcstudent/webview"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // handle web view
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, webViewChannel).setMethodCallHandler { call, result ->
            when (call.method) {
                "launchWebView" -> {
                    val pageUrl = call.argument<String>("url")
                    if (pageUrl.isNullOrEmpty()) {
                        result.error("-1", "invalid url", "url must not be null")
                    } else {
                        val intent = WebViewActivity.newIntent(this, pageUrl)
                        startActivity(intent)
                        result.success(1)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }
}
