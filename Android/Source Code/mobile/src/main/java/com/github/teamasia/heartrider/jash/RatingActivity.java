package com.github.teamasia.heartrider.jash;


import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

import com.github.teamasia.heartrider.R;


public class RatingActivity extends Activity {

    private AlertDialog.Builder alert;
    private Button button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rating);
        alert = new AlertDialog.Builder(RatingActivity.this);
        alert.setTitle("Submitted. Thanks for your feedback!");
        button = (Button) findViewById(R.id.rating_submit);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                alert.show();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        //getMenuInflater().inflate(R.menu.menu_rating, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    /* Initiates the onClick method for Sumbit button
     * to take the user to a new page, notifying that they are done
     */
    public void message(View view) {
        //Intent intent = new Intent(this, DisplayResult.class);
        //startActivity(intent);
    }
}
