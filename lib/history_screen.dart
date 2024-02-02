import 'package:flutter/material.dart';
import 'package:server_access/data/history_data.dart';
import 'package:server_access/data/noti.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: history.where((element) => element.isAccepted != null).isEmpty
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
            : SingleChildScrollView(
                child: Column(
                  children: history
                      .where((element) => element.isAccepted != null)
                      .map((e) => Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    e.image,
                                    width: 10,
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                e.name,
                                                style: const TextStyle(
                                                  color: Color(0xFF525151),
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              e.serverName,
                                              style: const TextStyle(
                                                color: Color(0xFF525151),
                                                fontSize: 14,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        e.time,
                                        style: const TextStyle(
                                          color: Color(0xFF525151),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      Text(e.country)
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  children: [
                                    if (e.isAccepted == false ||
                                        e.isAccepted == null) ...[
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset('assets/bold.png'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        '拒否されました',
                                        style: TextStyle(
                                          color: Color(0xFF525151),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                    if (e.isAccepted == true ||
                                        e.isAccepted == null) ...[
                                      Image.asset('assets/Vector.png'),
                                      const Text(
                                        '承認されました',
                                        style: TextStyle(
                                          color: Color(0xFF525151),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 120,
                                      )
                                    ]
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
      ),
    );
  }
}
