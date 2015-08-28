package com.github.teamasia.heartrider.before;

import android.app.Activity;
import android.os.Bundle;
import android.support.wearable.view.WatchViewStub;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.github.teamasia.heartrider.R;

public class WaitActivity extends Activity {

    private TextView mTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_wait);
        final WatchViewStub stub = (WatchViewStub) findViewById(R.id.watch_view_stub);
        stub.setOnLayoutInflatedListener(new WatchViewStub.OnLayoutInflatedListener() {
            @Override
            public void onLayoutInflated(WatchViewStub stub) {
                mTextView = (TextView) stub.findViewById(R.id.text);
                Bundle extras = getIntent().getExtras();
                if (extras != null)
                {
                    String wait_time = extras.getString("time");
                    final TimerTextView timerTextView = (TimerTextView)findViewById(R.id.timer_text_view);
                    long[] times = {0, 0, Long.parseLong(wait_time), 0};
                    timerTextView.setTimes(times);
                    if (!timerTextView.isRun())
                        if (timerTextView.beginRun() == 1){
                            ((Button) stub.findViewById(R.id.detectButton)).setVisibility(View.VISIBLE);
                        }
                }
            }
        });
    }
}

