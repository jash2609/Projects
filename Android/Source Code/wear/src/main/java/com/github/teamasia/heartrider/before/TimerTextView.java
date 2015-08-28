package com.github.teamasia.heartrider.before;

import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

/**
 * Created by haofu on 7/31/15.
 */

public class TimerTextView extends TextView implements Runnable{

    public TimerTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        // TODO Auto-generated constructor stub
    }

    private long mday, mhour, mmin, msecond;
    private boolean run=false; //是否启动了

    public void setTimes(long[] times) {
        mday = times[0];
        mhour = times[1];
        mmin = times[2];
        msecond = times[3];

    }


    private void ComputeTime() {
        msecond--;
        if (msecond < 0) {
            mmin--;
            msecond = 59;
            if (mmin < 0) {
                mmin = 59;
                mhour--;
                if (mhour < 0) {
                    mhour = 23;
                    mday--;

                }
            }

        }

    }

    public boolean isRun() {
        return run;
    }

    private int f = 0;

    public int beginRun() {
        this.run = true;
        run();
        return f;
    }

    public void stopRun(){
        this.run = false;
    }


    @Override
    public void run() {
        //标示已经启动
        if(run && f == 0){
            ComputeTime();
            String strTime= mhour+"hour:"+ mmin+"min:"+msecond+"sec";
            this.setText(strTime);
            postDelayed(this, 1000);
            if (mday == 0 && mhour == 0 && mmin == 0 && msecond == 0){
                f = 1;
                this.setText("GO!");
                this.setOnClickListener(new OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        // Set Intent and start new activity
                        Intent intent = new Intent(getContext(), TrackingDataActivity.class);
                        getContext().startActivity(intent);
                    }
                });
            }
        }else {
            removeCallbacks(this);
        }
    }

}
