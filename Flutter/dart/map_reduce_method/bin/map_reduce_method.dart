import 'package:equatable/equatable.dart';
class Sleep extends Equatable {
  const Sleep({
    this.wakeTime,
    this.sleepTime,
    this.totalSleep,
  });

  final int wakeTime;
  final int sleepTime;
  final int totalSleep;


  @override
  List<Object> get props => 
  [
    wakeTime,
    sleepTime,
    totalSleep,
  ];

  Sleep copyWith({
    int wakeTime,
    int sleepTime,
    int totalSleep,
  }){
    return Sleep(
      wakeTime : wakeTime ?? this.wakeTime,
      sleepTime : sleepTime ?? this.sleepTime,
      totalSleep : totalSleep ?? this.totalSleep,
    );
  }
}

void main(List<String> arguments) {
  final sleep1 = Sleep().copyWith(
    wakeTime: 4,
    sleepTime: 1,
    totalSleep:  5,
  );

  final sleep2 = Sleep().copyWith(
    wakeTime: 7,
    sleepTime: 1,
    totalSleep:  8,
  );

  final sleep3 = Sleep().copyWith(
    wakeTime: 12,
    sleepTime: 3,
    totalSleep:  15,
  );

  List<Sleep> sleep = [];
  sleep.add(sleep1);
  sleep.add(sleep2);
  sleep.add(sleep3);
  
  print('sleep1 $sleep1');
  print('sleep2 $sleep2');
  print('sleep3 $sleep3');
  print('sleep $sleep');

  Sleep result;
  result = sleep.reduce((a, b) => a == b ? a : b);

  final totalSleepList = sleep.map((e) => e.totalSleep).toList();
  totalSleepList.forEach((element) {print(element);});

  final totalSleep = sleep.map((e) => e.totalSleep).reduce((a, b) => a + b);

  print('totalSleepList $totalSleepList');
  print('Total Sleep $totalSleep');
  print('result $result');
}
