class WorldClock {
  const WorldClock();

  Stream<DateTime> get currentLocalTime {
    return Stream.periodic(
        const Duration(seconds: 1), (_) => DateTime.now().toLocal());
  }
}
