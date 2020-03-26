# Flutter-Tutorials
Practicing and exploring flutter

## Flutter build commands
Flutter build for android apk
```
flutter build apk --release
```

Flutter update/change app launcher icon
```
flutter pub pub run flutter_launcher_icons:main 
```

---
## Notes
1. Add the below line to android manifest file to allow web view
```
<uses-permission android:name="android.permission.INTERNET"/>
```