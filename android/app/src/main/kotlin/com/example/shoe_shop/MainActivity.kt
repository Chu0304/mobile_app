package com.example.shoe_shop

import io.flutter.embedding.android.FlutterFragmentActivity  // ✅ Import
import android.os.Bundle

class MainActivity: FlutterFragmentActivity() {           // ✅ Must extend FlutterFragmentActivity
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }
}
