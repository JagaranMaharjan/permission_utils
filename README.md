## Handled permission for

- camera
- gallery
- storage
- contact
- microphone

## Add following permission on android manifest file outside application tag

- For Camera:
    - "<uses-permission android:name="android.permission.CAMERA" />"
    - "<uses-permission android:name="android.permission.ACCESS_MEDIA_LOCATION" />"
    
- For Photos, Audio, Video:
    - "<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />"
    - "<uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />"
    - "<uses-permission android:name="android.permission.READ_MEDIA_AUDIO" />"
    
- For Storage:
    - "<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"
      android:maxSdkVersion="29" />"
    - "<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"
      android:maxSdkVersion="32" />"
    - 
- For Contact:
  - "<uses-permission android:name="android.permission.READ_CONTACTS" />"
  - "<uses-permission android:name="android.permission.WRITE_CONTACTS" />"
- For Microphone:
  - "<uses-permission android:name="android.permission.RECORD_AUDIO" />"

- For Location - Android
  - "<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />"
  - "<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />"
  - "<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />"

    "<key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to location when open.</string>
    <key>NSLocationAlwaysUsageDescription</key>
    <string>This app needs access to location when in the background.</string>"