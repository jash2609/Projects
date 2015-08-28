package com.github.teamasia.heartrider.datatrack;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class SendOpenPlotService extends Service {
    public SendOpenPlotService() {
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        DeviceClient dc = DeviceClient.getInstance(this);
        dc.sendPlotMessage();
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }
}
