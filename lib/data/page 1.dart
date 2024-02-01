import 'package:flutter/material.dart';
import 'package:server_access/data/noti.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: notifications.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset("assets/formkit.png"),
                const Text(
                  '何も見せられない\n現時点で',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF525151),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            )
          : Column(
              children: notifications
                  .map((e) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Image.asset(
                                  e.image,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          e.name,
                                          style: const TextStyle(
                                            color: Color(0xFF525151),
                                            fontSize: 12,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        e.serverName,
                                        style: const TextStyle(
                                          color: Color(0xFF525151),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [Text(e.time), Text(e.country)],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        e.isAccepted = false;
                                        history.add(e);
                                        notifications.remove(e);
                                      });
                                    },
                                    child: Image.asset('assets/bold.png')),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      e.isAccepted = false;
                                      history.add(e);
                                      notifications.remove(e);
                                    });
                                  },
                                  child: const Text(
                                    '拒否する',
                                    style: TextStyle(
                                      color: Color(0xFF525151),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        e.isAccepted = true;
                                        history.add(e);
                                        notifications.remove(e);
                                      });
                                    },
                                    child: Image.asset('assets/Vector.png')),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      e.isAccepted = true;
                                      history.add(e);
                                      notifications.remove(e);
                                    });
                                  },
                                  child: const Text(
                                    '受け入れる',
                                    style: TextStyle(
                                      color: Color(0xFF525151),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 120,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ))
                  .toList(),
            ),
    );
  }
}
