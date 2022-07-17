<!-- android/app/build.gradle

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation 'com.github.HBiSoft:HBRecorder:2.0.3'
    implementation 'androidx.appcompat:appcompat:1.4.1'
}
android/app/src/main/AndroidManifest.xml

    xmlns:tools="http://schemas.android.com/tools"
    package="com.example">
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="28" tools:ignore="ScopedStorage" />
    <uses-permission android:name="android.permission.WRITE_INTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
You only need add the permission message on the Info.plist

  <key>NSPhotoLibraryUsageDescription</key>
	<string>Save video in gallery</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>Save audio in video</string>

Usage/Examples
import 'package:screen_recorder/screen_recorder.dart';

ScreenRecorder? screenRecorder;
Map<String, dynamic>? _response;

@override
void initState() {
    super.initState();
    screenRecorder = ScreenRecorder();
}

  Future<void> startRecord({required String fileName}) async {
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;
    var response = await edScreenRecorder?.startRecordScreen(
      fileName: fileName,
      dirPathToSave: tempPath, //Optional. It will save the video there when you give the file path with whatever you want.
      audioEnable: false,
    );

    setState(() {
      _response = response;
    });
  }

  Future<void> stopRecord() async {
    var response = await edScreenRecorder?.stopRecord();
    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Recording Debug"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("File: ${(_response?['file'] as File?)?.path}"),
            Text("Status: ${(_response?['success']).toString()}"),
            Text("Event: ${_response?['eventname']}"),
            Text("Progress: ${(_response?['progressing']).toString()}"),
            Text("Message: ${_response?['message']}"),
            Text("Video Hash: ${_response?['videohash']}"),
            Text("Start Date: ${(_response?['startdate']).toString()}"),
            Text("End Date: ${(_response?['enddate']).toString()}"),
            ElevatedButton(onPressed: () => startRecord(fileName: "eren"), child: const Text('START RECORD')),
            ElevatedButton(onPressed: () => stopRecord(), child: const Text('STOP RECORD')),
          ],
        ),
      ),
    );
  }
Resources used within the plugin
HBRecorder Lightweight screen and audio recording Android library. URL

Watcher

A file system watcher. URL

UUID

Simple, fast generation of RFC4122 UUIDs. URL -->