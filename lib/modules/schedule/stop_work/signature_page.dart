import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ft/modules/schedule/sched_details/service_call_details.dart';
import 'package:ft/modules/schedule/shared_widget/actions_button.dart';
import 'package:rxdart/rxdart.dart';
import '../../../core/main/main.dart';
import '../../../services/locator.dart';
import '../../../shared_widgets/toasts.dart';
import '../../../utils/utils/image/canvas.dart';
import '../../../utils/utils/theme/global_colors.dart';
import 'stop_work.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  //blocs
  final serviceCallDetailsBloc = locator.get<ServiceCallDetailsBloc>();
  final stopWorkBloc = locator.get<StopWorkBloc>();
  final mainBloc = locator.get<MainBloc>();

  List<DrawModel?> pointsList = [];
  GlobalKey? keyImage;
  Uint8List? bytesImage;
  final pointsStream = BehaviorSubject<List<DrawModel?>>();
  GlobalKey key = GlobalKey();

  @override
  void dispose() {
    pointsStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stopWorkDto = stopWorkBloc.stopWorkDto;

    return Scaffold(
        key: key,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              GestureDetector(
                  onPanStart: (details) {
                    RenderBox renderBox =
                        key.currentContext!.findRenderObject() as RenderBox;
                    Paint paint = Paint();

                    paint.color = Colors.black;
                    paint.strokeWidth = 3.0;
                    paint.strokeCap = StrokeCap.round;

                    pointsList.add(DrawModel(
                      offset: renderBox.globalToLocal(details.globalPosition),
                      paint: paint,
                    ));

                    pointsStream.add(pointsList);
                  },
                  onPanUpdate: (details) {
                    RenderBox renderBox =
                        key.currentContext!.findRenderObject() as RenderBox;
                    Paint paint = Paint();
                    paint.color = Colors.black;
                    paint.strokeWidth = 3.0;
                    paint.strokeCap = StrokeCap.round;

                    pointsList.add(DrawModel(
                      offset: renderBox.globalToLocal(details.globalPosition),
                      paint: paint,
                    ));

                    pointsStream.add(pointsList);
                  },
                  onPanEnd: (details) {
                    pointsList.add(null);
                    pointsStream.add(pointsList);
                  },
                  child: Card(
                    color: mainBloc.isDarkTheme$.value
                        ? ftBlackContainer
                        : ftWhite,
                    child: WidgetToImage(
                      builder: (key) {
                        keyImage = key;
                        return Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: StreamBuilder<List<DrawModel?>>(
                                stream: pointsStream.stream,
                                builder: (context, snapshot) {
                                  return CustomPaint(
                                      painter: DrawingPainter(
                                          (snapshot.data ?? [])));
                                }));
                      },
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 30, 0, 0),
                child: Row(
                  children: const [
                    BackButton(
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Customer Signature ',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ]),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.timelapse),
                            const SizedBox(width: 15),
                            _items('${stopWorkDto.timeSpent!} min', 'Duration'),
                          ],
                        ),
                        const Divider(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.paid),
                            const SizedBox(width: 15),
                            Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runSpacing: 5,
                              spacing: 40,
                              children: [
                                _items(' \$${stopWorkDto.charges![0]}', 'Rate'),
                                _items(' \$${stopWorkDto.charges![1]}', 'Trip'),
                                _items(
                                    ' \$${stopWorkDto.charges![2]}', 'Others'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Total Service Fee:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                ' \$${stopWorkDto.charges![3]}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ),
                const SizedBox(height: 20),
                ActionButtons(
                    isEnable: true,
                    text: 'Confirm Signature',
                    callback: () async {
                      final bytes1 = await capture(keyImage!);
                      if ((bytes1 as Uint8List).length < 7000) {
                        showToast('Signature too short');
                      }

                      stopWorkBloc.currentCustomerSignature.add(bytes1);
                      Navigator.of(context).pop();
                    }),
              ],
            )
          ],
        ));
  }

  Widget _items(String value, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name),
        const SizedBox(
          height: 5,
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<DrawModel?> pointsList;

  DrawingPainter(this.pointsList);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < (pointsList.length - 1); i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        canvas.drawLine(pointsList[i]!.offset, pointsList[i + 1]!.offset,
            pointsList[i]!.paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        List<Offset> offsetList = [];
        offsetList.add(pointsList[i]!.offset);
        canvas.drawPoints(PointMode.points, offsetList, pointsList[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DrawModel {
  final Offset offset;
  final Paint paint;

  DrawModel({required this.offset, required this.paint});
}
