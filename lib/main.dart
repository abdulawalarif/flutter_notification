import 'package:flutter/material.dart';
import 'package:notification/notification_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationsServices notificationsServices = NotificationsServices();

  @override
  void initState() {
    super.initState();
    notificationsServices.initialiseNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Notification"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                notificationsServices.sendNotification(
                    "this is a title", "this is a body");
              },
              child: const Text("Send Notification"),
            ),
            ElevatedButton(
              onPressed: () {
                notificationsServices.secheduleNotification(
                    "peridic", "This is Body");
              },
              child: const Text("Schedule Notification"),
            ),
            ElevatedButton(
              onPressed: () {
                notificationsServices.stopNotifications();
              },
              child: const Text("Stop Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
