enum Interval {
  oneHour('1h'),
  fourHours('4h'),
  oneDay('1d');

  final String timeframe;

  const Interval(this.timeframe);
}
