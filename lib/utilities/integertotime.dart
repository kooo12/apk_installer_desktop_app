String intToTime(int value) {
  int h, m, s;

  h = value ~/ 3600;

  m = ((value - h * 3600)) ~/ 60;

  s = value - (h * 3600) - (m * 60);

  String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();

  String minuteLeft =
      m.toString().length < 2 ? "0" + m.toString() : m.toString();

  String secondsLeft =
      s.toString().length < 2 ? "0" + s.toString() : s.toString();
  String result = "";
  if (value > (60 * 60))
    result = "$hourLeft:$minuteLeft:$secondsLeft";
  else
    result = "$minuteLeft:$secondsLeft";
  return result;
}
