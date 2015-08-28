package com.github.teamasia.heartrider.data;

import android.hardware.Sensor;
import android.util.SparseArray;

public class SensorNames {
    public SparseArray<String> names;

    public SensorNames() {
        names = new SparseArray<String>();

        names.append(android.hardware.Sensor.TYPE_ACCELEROMETER, "Accelerometer");
        names.append(Sensor.TYPE_HEART_RATE, "Heart Rate");

    }

    public String getName(int sensorId) {
        String name = names.get(sensorId);

        if (name == null) {
            name = "Unknown";
        }

        return name;
    }
}
