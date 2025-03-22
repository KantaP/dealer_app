import 'package:rxdart/rxdart.dart';

class CustomStreamSubject<T> {
  final T seeded;

  late BehaviorSubject<T> subject;
  CustomStreamSubject(this.seeded) {
    subject = BehaviorSubject<T>.seeded(seeded);
  }

  Stream<T> state() {
    return subject;
  }

  void setValue(T value) {
    subject.add(value);
  }

  void dispose() {
    subject.close();
  }
}
