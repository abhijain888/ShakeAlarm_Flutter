import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shake_alarm_flutter/qoute_model.dart';
import 'dart:math';
part 'qoute_event.dart';
part 'qoute_state.dart';

class QouteBloc extends Bloc<QouteEvent, QouteState> {
  int index = 0;
  Random random = Random();
  QouteBloc()
      : super(QouteState(
          backColor: Colors.blueAccent[100]!,
          cardColor: Colors.blueAccent[400]!,
          qoute: Qoute(
            qoute:
                "Dream is not that which you see while sleeping it is something that does not let you sleep.",
            author: "Dr.A.P.J Abdul Kalam",
          ),
        )) {
    on<ShakeQouteEvent>((event, emit) {
      index = random.nextInt(colors.length);
      emit(
        QouteState(
          qoute: qoutes[index],
          backColor: colors[index],
          cardColor: cardColors[index],
        ),
      );
    });
  }

  List<Color> colors = [
    Colors.blueAccent[100]!,
    Colors.purple[100]!,
    Colors.teal[100]!,
    Colors.red[100]!,
    Colors.purple[100]!,
    Colors.cyan[100]!,
    Colors.blueGrey[100]!,
  ];

  List<Color> cardColors = [
    Colors.blueAccent[400]!,
    Colors.purple[400]!,
    Colors.teal[400]!,
    Colors.red[400]!,
    Colors.purple[400]!,
    Colors.cyan[400]!,
    Colors.blueGrey[400]!,
  ];

  List<Qoute> qoutes = [
    Qoute(
      qoute:
          "Dream is not that which you see while sleeping it is something that does not let you sleep.",
      author: "Dr.A.P.J Abdul Kalam",
    ),
    Qoute(
      qoute:
          "Right knowledge, right faith, right conduct, leads a life to liberty",
      author: "Bhagwan Mahavir",
    ),
    Qoute(
      qoute:
          "There is but one God. True is His Name, creative His personality and immortal His form. He is without fear sans enmity, unborn and self-illumined. By the Guru's grace He is obtained.",
      author: "Guru Nanak Dev",
    ),
    Qoute(
      qoute:
          "We are what our thoughts have made us; so take care about what you think. Words are secondary. Thoughts live; they travel far.",
      author: "Swami Vivekananda",
    ),
    Qoute(
      qoute:
          "An equation means nothing to me unless it expresses a thought of God.",
      author: "Srinivasa Ramanujan",
    ),
    Qoute(
      qoute:
          "All know that the drop merges into the ocean but few know that the ocean merges into the drop.",
      author: "Sant Kabir",
    ),
    Qoute(
      qoute:
          "The real frienship is like fluorescence, it shines better when everything has darken.",
      author: "Rabindranath Tagore",
    ),
  ];
}
