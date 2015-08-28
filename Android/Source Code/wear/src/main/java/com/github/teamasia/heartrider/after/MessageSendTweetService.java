package com.github.teamasia.heartrider.after;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

import com.github.teamasia.heartrider.datatrack.DeviceClient;
import com.google.android.gms.common.api.GoogleApiClient;

/**
 * Created by Jash on 7/9/2015.
 */
public class MessageSendTweetService extends Service{

    private static final String
            CAPABILITY_NAME = "tweet_rate";
    private static final String RECEIVER_SERVICE_PATH = "/tweet";
    private GoogleApiClient xt;
    private DeviceClient dc;

    @Override
    public void onCreate() {
        super.onCreate();
        Log.d("MessageSendTweetService", "created");
        Log.d("MessageSendTweetService", "starting...");
        dc = DeviceClient.getInstance(this);
        dc.sendSensorData(-2, -1, -1, null);
        Log.d("MessageSendTweetService", "sent");
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startID) {
        Log.d("MessageSendTweetService", "starting...");
        dc = DeviceClient.getInstance(this);
        dc.sendSensorData(-2,-1,-1,null);
        Log.d("MessageSendTweetService", "sent");
        /*

        xt = new GoogleApiClient.Builder(this)
                .addConnectionCallbacks(new GoogleApiClient.ConnectionCallbacks() {
                    @Override
                    public void onConnected(Bundle bundle) {

                    }

                    @Override
                    public void onConnectionSuspended(int i) {

                    }
                })
                .addOnConnectionFailedListener(new GoogleApiClient.OnConnectionFailedListener() {
                    @Override
                    public void onConnectionFailed(ConnectionResult connectionResult) {

                    }
                })
                .addApi(Wearable.API)
                .build();
        this.xt.connect();

        new Thread(new Runnable() {
            @Override
            public void run() {
                CapabilityApi.GetCapabilityResult capResult =
                        Wearable.CapabilityApi.getCapability(
                                xt, CAPABILITY_NAME,
                                CapabilityApi.FILTER_REACHABLE)
                                .await();

                Set <Node> nodes = capResult.getCapability().getNodes();

                String nodeId = null;
                for (Node node : nodes) {
                    nodeId = node.getId();
                }
                Log.d("MessageSendTweetService", "sending message...");

                Wearable.MessageApi.sendMessage(
                        xt, nodeId, RECEIVER_SERVICE_PATH, new byte[3]);


            }
        }).start();

*/
        return Service.START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

}
