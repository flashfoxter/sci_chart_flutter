# flutter_sci_chart_plugin

A Sci-Chart Flutter plugin.


## Usage

Make sure you have Flutter installed on your local machine. For more instructions on how to install flutter, look [here](https://flutter.io/docs/get-started/install).

```
git clone https://github.com/raminvakili-fs/sci_chart_flutter.git

```

Open `FlutterSciChartPlugin.java` in `sci_chart_flutter/android/src/main/java/com/binary/flutter_sci_chart_plugin/` and put your license string in `setLicense` method:

FlutterSciChartPlugin.java:
```
private static void setLicense() {
    try {
      SciChartSurface.setRuntimeLicenseKey("Your license");
    } catch (Exception e) {
      Log.e("SciChart", "Error when setting the license", e);
    }
  }
```

Then navigate to example's main folder where its the pubspec.yaml is and run following command to launch the App:
```
flutter run
```