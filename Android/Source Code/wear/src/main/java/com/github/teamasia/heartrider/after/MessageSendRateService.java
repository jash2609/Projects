package com.github.teamasia.heartrider.after;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

import com.github.teamasia.heartrider.datatrack.DeviceClient;
import com.google.android.gms.common.api.GoogleApiClient;

/**
 * Created by Jash on 7/31/2015.
 */
public class MessageSendRateService extends Service {
    private static final String
            CAPABILITY_NAME = "tweet_rate";
    private static final String RECEIVER_SERVICE_PATH1 = "/rate";
    private GoogleApiClient xt;
    private DeviceClient dc;

    @Override
    public int onStartCommand(Intent intent, int flags, int startID) {
        dc = DeviceClient.getInstance(this);
        Log.d("MessageSendRateService", "starting...");
        dc.sendSensorData(-1, -1, -1, null);    //first -1 represents request for rate
        Log.d("MessageSendRateService", "sent");
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

                Log.d("MessageSendRateService", "sending message...");
                Wearable.MessageApi.sendMessage(
                        xt, nodeId, RECEIVER_SERVICE_PATH1, new byte[3]);


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
