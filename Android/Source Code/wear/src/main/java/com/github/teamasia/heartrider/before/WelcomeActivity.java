package com.github.teamasia.heartrider.before;


import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.support.wearable.view.DotsPageIndicator;
import android.support.wearable.view.GridPagerAdapter;
import android.support.wearable.view.GridViewPager;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.github.teamasia.heartrider.R;
import com.github.teamasia.heartrider.datatrack.SensorService;

public class WelcomeActivity extends Activity {

    //---The images to display---
    //---Here we use a 2D array for row/column indexing---
    Integer[][] carImageIDs = {
            {R.drawable.cm,
                    R.drawable.cm,
                    R.drawable.cm},
            {R.drawable.am,
                    R.drawable.am,
                    R.drawable.am},
            {R.drawable.bm,
                    R.drawable.bm,
                    R.drawable.bm}
    };

    String [][] StringIDs = {
            {"Distance: 0.5mi", "Waiting time: 1 min", " "},
            {"Distance: 1.2mi", "Waiting time: 3 min", " "},
            {"Distance: 1.3mi", "Waiting time: 4 min", " "}
    };

    int [] waittimes = {
            1, 3 , 4
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcome);
        final Resources res = getResources();
        final GridViewPager pager = (GridViewPager) findViewById(R.id.pager);

        //---Assigns an adapter to provide the content for this pager---
        pager.setAdapter(new ImageAdapter(this));
        DotsPageIndicator dotsPageIndicator = (DotsPageIndicator) findViewById(R.id.page_indicator);
        dotsPageIndicator.setPager(pager);
        startService(new Intent(this, SensorService.class));
    }

    public class ImageAdapter extends GridPagerAdapter {
        final Context mContext;

        public ImageAdapter(final Context context) {
            mContext = context;
        }

        @Override
        public int getRowCount() {
            return 3;
        }

        @Override
        public int getColumnCount(int i) {
            return 3;
        }

        //---Go to current column when scrolling up or down (instead of default column 0)---
        @Override
        public int getCurrentColumnForRow(int row, int currentColumn) {
            return currentColumn;
        }

        //---Return our car image based on the provided row and column---
        @Override
        protected Object instantiateItem(ViewGroup viewGroup, final int row, int col) {
            //ImageView imageView;
            //imageView = new ImageView(mContext);
            //imageView.setImageResource(carImageIDs[row][col]);
            //imageView.setBackgroundColor(Color.rgb(236, 238, 242));
            //viewGroup.addView(imageView);
            //return imageView;
            if (col<= 1){
                LinearLayout linearLayout = new LinearLayout(mContext);
                linearLayout.setOrientation(LinearLayout.VERTICAL);
                linearLayout.setBackgroundResource(carImageIDs[row][col]);
                TextView tt = new TextView(mContext);
                tt.setHeight(220);
                TextView t = new TextView(mContext);
                t.setGravity(Gravity.CENTER | Gravity.TOP);
                t.setHeight(100);
                t.setTextColor(Color.WHITE);
                t.setTextSize(20);
                t.setBackgroundColor(getResources().getColor(R.color.colorPrimary));
                t.setText(StringIDs[row][col]);
                linearLayout.addView(tt);
                linearLayout.addView(t);
                viewGroup.addView(linearLayout);
                return linearLayout;
            } else {
                LinearLayout linearLayout = new LinearLayout(mContext);
                linearLayout.setOrientation(LinearLayout.VERTICAL);
                linearLayout.setBackgroundResource(carImageIDs[row][col]);
                TextView tt = new TextView(mContext);
                tt.setHeight(200);

                Button t = new Button(mContext);
                t.setText("Go to line");
                t.setGravity(Gravity.CENTER | Gravity.TOP);

                t.setHeight(120);
                t.setTextColor(Color.WHITE);
                t.setTextSize(24);
                t.setBackground(getResources().getDrawable(R.drawable.round_button, getTheme()));
                t.setBackgroundColor(getResources().getColor(R.color.colorPrimary));
                t.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Intent intent = new Intent(WelcomeActivity.this, WaitActivity.class);
                        intent.putExtra("time", Integer.toString(waittimes[row]));
                        startActivity(intent);
                    }
                });
                linearLayout.addView(tt);
                linearLayout.addView(t);
                viewGroup.addView(linearLayout);
                return linearLayout;
            }


            //t.setBackgroundResource(carImageIDs[row][col]);

//            ImageView imageView = new ImageView(mContext);
//            imageView.setImageResource(carImageIDs[row][col]);

            //Button tt = new Button(mContext);

            //tt.setText("kfkfkfk");

            //TextView ttt = new TextView(mContext);
            //ttt.setText("sdfsdfsdf");
            //ttt.setGravity(Gravity.BOTTOM);
            //ttt.setHeight(160);
            //ttt.setBackgroundColor(Color.BLUE);
//            linearLayout.addView(imageView);

            //linearLayout.addView(tt);
//            linearLayout.addView(t);
            //viewGroup.addView(tt);
//            viewGroup.addView(tt,2);
//            viewGroup.addView(t, 1);

        }

        @Override
        protected void destroyItem(ViewGroup viewGroup, int i, int i2, Object o) {
            viewGroup.removeView((View) o);
        }

        @Override
        public boolean isViewFromObject(View view, Object o) {
            return view.equals(o);
        }
    }
}
