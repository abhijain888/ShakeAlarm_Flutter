import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  static const int _alarmId = 001;
  late TimeOfDay selectedTime;
  late StreamSubscription subscription;

  bool isAlarmSet = false;

  late ShakeDetector shakeDetector;

  @override
  void initState() {
    selectedTime = TimeOfDay(
      hour: DateTime.now().hour,
      minute: DateTime.now().minute,
    );

    subscription = Alarm.ringStream.stream.listen(
      (alarmSettings) {},
    );

    shakeDetector = ShakeDetector.autoStart(
      minimumShakeCount: 1,
      onPhoneShake: () {
        setState(() {
          isAlarmSet = false;
        });
        Alarm.stop(_alarmId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Alarm"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          RawMaterialButton(
            onPressed: pickTime,
            fillColor: Colors.grey[200],
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                selectedTime.format(context),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.blueAccent),
              ),
            ),
          ),
          isAlarmSet
              ? const Text("Shake phone to stop alarm")
              : TextButton(
                  onPressed: () {
                    setState(() {
                      isAlarmSet = true;
                    });
                    final now = DateTime.now();
                    DateTime dateTime = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      selectedTime.hour,
                      selectedTime.minute,
                      0,
                      0,
                    );
                    final alarmSettings = AlarmSettings(
                      id: _alarmId,
                      dateTime: dateTime,
                      assetAudioPath: "assets/tunes/nokia.mp3",
                    );
                    Alarm.set(alarmSettings: alarmSettings);
                  },
                  child: const Text("SET TIMER"),
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<void> pickTime() async {
    final res = await showTimePicker(
      initialTime: selectedTime,
      context: context,
    );
    if (res != null) setState(() => selectedTime = res);
  }
}
