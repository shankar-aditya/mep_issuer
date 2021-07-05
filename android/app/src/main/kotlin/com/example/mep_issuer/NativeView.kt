package com.example.mep_issuer

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        textView = TextView(context)
        textView.textSize = 20f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        if(creationParams?.get("sdk")=="Digital Wallet")
            textView.text = "\n App Id: ${creationParams?.get("appId")} \n\n Environment: ${creationParams?.get("environment")} \n\n Entry Mode: ${creationParams?.get("entryMode")}"
        else
            textView.text = "\n Entry Mode: ${creationParams?.get("userMode")} \n\n Step Up Type: ${creationParams?.get("stepUp")} \n\n Request Id: ${creationParams?.get("requestId")} \n\n Card Owner Verified At: ${creationParams?.get("timeStamp")} "
    }
}
