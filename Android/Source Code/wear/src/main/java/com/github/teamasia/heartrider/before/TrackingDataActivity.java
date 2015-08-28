package com.github.teamasia.heartrider.before;

import android.app.Activity;
import android.os.Bundle;
import android.support.wearable.view.DismissOverlayView;
import android.support.wearable.view.WatchViewStub;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.widget.TextView;

import com.github.teamasia.heartrider.R;

public class TrackingDataActivity extends Activity {

    private TextView mTextView;
    private DismissOverlayView mDismissOverlay;
    private GestureDetector mDetector;
    private final String TAG = "TrackingDataActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tacking_data);
        // Obtain the DismissOverlayView element

        final WatchViewStub stub = (WatchViewStub) findViewById(R.id.watch_view_stub);
        stub.setOnLayoutInflatedListener(new WatchViewStub.OnLayoutInflatedListener() {
            @Override
            public void onLayoutInflated(WatchViewStub stub) {
                mTextView = (TextView) stub.findViewById(R.id.text);
            }
        });

        mDismissOverlay = (DismissOverlayView) findViewById(R.id.dismiss_overlay);
        mDismissOverlay.setIntroText(R.string.exit_info);
        mDismissOverlay.showIntroIfNecessary();


        // Configure a gesture detector
        mDetector = new GestureDetector(this, new GestureDetector.SimpleOnGestureListener() {
            @Override
            public void onLongPress(MotionEvent ev) {
                Log.d(TAG, "onLongPress: " + ev.toString());
                mDismissOverlay.show();
            }

            @Override
            public boolean onDoubleTap(MotionEvent event) {
                Log.d(TAG, "onDoubleTap: " + event.toString());
                mDismissOverlay.show();
                return true;
            }

        });

        //startService(new Intent(this, SensorService.class));

        Log.d(TAG, "doing show... " );
        mDismissOverlay.show();
        Log.d(TAG, "done");


    }

    @Override
    public boolean onTouchEvent(MotionEvent ev) {
        Log.d(TAG, "onTouchEvent: " + ev.toString());

        return mDetector.onTouchEvent(ev) || super.onTouchEvent(ev);
    }
}
