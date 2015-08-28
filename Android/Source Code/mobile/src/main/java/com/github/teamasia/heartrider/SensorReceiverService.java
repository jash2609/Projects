package com.github.teamasia.heartrider;

import android.content.Intent;
import android.hardware.Sensor;
import android.net.Uri;
import android.util.Log;

import com.github.teamasia.heartrider.jash.RatingActivity;
import com.github.teamasia.heartrider.jash.SendingTwitterActivity;
import com.github.teamasia.heartrider.shared.DataMapKeys;
import com.google.android.gms.wearable.DataEvent;
import com.google.android.gms.wearable.DataEventBuffer;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataMap;
import com.google.android.gms.wearable.DataMapItem;
import com.google.android.gms.wearable.MessageEvent;
import com.google.android.gms.wearable.Node;
import com.google.android.gms.wearable.WearableListenerService;

import java.util.Arrays;

public class SensorReceiverService extends WearableListenerService {
    private static final String TAG = "SensorDashboard/SensorReceiverService";
    private static final String RECEIVER_SERVICE_PATH = "/tweet";
    private static final String RECEIVER_SERVICE_PATH1 = "/rate";
    private  boolean GOT_HEART_RATE = false;

    private RemoteSensorManager sensorManager;

    @Override
    public void onCreate() {
        super.onCreate();

        sensorManager = RemoteSensorManager.getInstance(this);
    }


    @Override
    public void onMessageReceived(MessageEvent messageEvent) {
        if (messageEvent.getPath().equals(RECEIVER_SERVICE_PATH)) {
            Log.d("y", "Got a message for tweet");
            SensorReceiverService.this.launchTwitterActivity();
        }
        if (messageEvent.getPath().equals(RECEIVER_SERVICE_PATH1)) {
            Log.d("y", "Got a message for rate");
            SensorReceiverService.this.launchRateActivity();
        }
    }

    private void  launchTwitterActivity() {
        Intent activityIntent = new Intent(this, SendingTwitterActivity.class);
        activityIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(activityIntent);
    }

    private void  launchRateActivity() {
        Intent activityIntent = new Intent(this, RatingActivity.class);
        activityIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(activityIntent);
    }

    @Override
    public void onPeerConnected(Node peer) {
        super.onPeerConnected(peer);

        Log.i(TAG, "Connected: " + peer.getDisplayName() + " (" + peer.getId() + ")");
    }

    @Override
    public void onPeerDisconnected(Node peer) {
        super.onPeerDisconnected(peer);

        Log.i(TAG, "Disconnected: " + peer.getDisplayName() + " (" + peer.getId() + ")");
    }

    @Override
    public void onDataChanged(DataEventBuffer dataEvents) {
        Log.d(TAG, "onDataChanged()");

        for (DataEvent dataEvent : dataEvents) {
            if (dataEvent.getType() == DataEvent.TYPE_CHANGED) {
                DataItem dataItem = dataEvent.getDataItem();
                Uri uri = dataItem.getUri();
                String path = uri.getPath();

                if (path.startsWith("/sensors/")) {
                    int sensorType = Integer.parseInt(uri.getLastPathSegment());
                  //  if (!GOT_HEART_RATE && sensorType!= Sensor.TYPE_HEART_RATE) return;
                  // if (sensorType == Sensor.TYPE_HEART_RATE) GOT_HEART_RATE = true;
                    if (sensorType != Sensor.TYPE_HEART_RATE ) return;
                    //&& sensorType != Sensor.TYPE_ACCELEROMETER
                    unpackSensorData(
                        Integer.parseInt(uri.getLastPathSegment()),
                        DataMapItem.fromDataItem(dataItem).getDataMap()
                    );
                }
            }
        }
    }

    private void unpackSensorData(int sensorType, DataMap dataMap) {

        int accuracy = dataMap.getInt(DataMapKeys.ACCURACY);
        long timestamp = dataMap.getLong(DataMapKeys.TIMESTAMP);
        float[] values = dataMap.getFloatArray(DataMapKeys.VALUES);
        if (accuracy==0 && timestamp ==0 && values==null) {
            //TODO wear push notif pressed
        }
        if (sensorType == Sensor.TYPE_HEART_RATE && values[0]==0.0) return;
        Log.d(TAG, "Received sensor data " + sensorType + " = " + Arrays.toString(values));
        sensorManager.addSensorData(sensorType, accuracy, timestamp, values);
    }
}
