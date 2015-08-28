package com.github.teamasia.heartrider.jash;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

import com.github.teamasia.heartrider.R;
import com.twitter.sdk.android.Twitter;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterApiClient;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterAuthToken;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.identity.TwitterLoginButton;
import com.twitter.sdk.android.core.models.Search;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.services.SearchService;
import com.twitter.sdk.android.tweetcomposer.TweetComposer;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.List;

import io.fabric.sdk.android.Fabric;


public class TwitterLoginActivity extends Activity {

    // Note: Your consumer key and secret should be obfuscated in your source code before shipping.
    private static final String TWITTER_KEY = "rpqWOR6CEIa5vuAdgRjzc8NQT";
    private static final String TWITTER_SECRET = "HjllJrzuEnlT6L1j3o35EtDJze5n5miRgTk2hpEibGPL7sEX3F";
    private static final String TAG = "TwitterLoginActivity";
    private static final String QUERY = "from:SixFlags";
    private static final String RESULT_TYPE = "mixed";
    private static final Integer COUNT = 4;
    private TwitterLoginButton loginButton;
    TwitterSession session;
    TwitterAuthToken authToken;
    String token, secret;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TwitterAuthConfig authConfig = new TwitterAuthConfig(TWITTER_KEY, TWITTER_SECRET);
        Fabric.with(this, new Twitter(authConfig));
        setContentView(R.layout.activity_twitter_login);
        loginButton = (TwitterLoginButton) findViewById(R.id.twitter_login_button);
        getTweets();
        loginButton.setCallback(new Callback<TwitterSession>() {
            @Override
            public void success(Result<TwitterSession> result) {
                session = Twitter.getSessionManager().getActiveSession();
                authToken = session.getAuthToken();
                token = authToken.token;
                secret = authToken.secret;
                postTweet(null);
            }

            @Override
            public void failure(TwitterException exception) {
                // Do something on failure
            }
        });



    }




    private void getTweets() {
        Log.d(TAG, "getting tweets...");
        TwitterApiClient twitterApiClient = TwitterCore.getInstance().getApiClient();
        // Can also use Twitter directly: Twitter.getApiClient()
        SearchService service = twitterApiClient.getSearchService();

        service.tweets(QUERY, null, null, null, RESULT_TYPE, COUNT, null, null, null, true, new Callback<Search>() {
            @Override
            public void success(Result<Search> result) {
                int i=0;
                Log.d(TAG, "query success");
                TwitterSession session = Twitter.getSessionManager().getActiveSession();

                List<Tweet> tweets = result.data.tweets;

                for (Tweet tweet : tweets) {
                        //String tweetImageUrl = tweet.entities.media.get(0).mediaUrl;
                        String tweetText = tweet.text;
                        long tweetId = tweet.id;
                        Bitmap tweetImage = null;

                    Log.d(TAG, "tweet id: "+ tweetId +"text: " + tweetText);
                }
            }

            @Override
            public void failure(TwitterException e) {

            }
        });

    }

    private Bitmap getBitmapFromUrl(String urlString) throws IOException {
        URL url = new URL(urlString);
        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }
        Bitmap image = BitmapFactory.decodeStream(url.openConnection().getInputStream());
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        image.compress(Bitmap.CompressFormat.PNG, 100, out);
        Bitmap decoded = BitmapFactory.decodeStream(new ByteArrayInputStream(out.toByteArray()));

        return decoded;
    }

    private void postTweet(Uri myImageUri) {
        TweetComposer.Builder builder = new TweetComposer.Builder(this)
                .text("My heart rate has reached 100 bpm at Pirate Rollercoaster at Six Flags!");
        builder.show();
    }



    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        loginButton.onActivityResult(requestCode, resultCode, data);


    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
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

}
