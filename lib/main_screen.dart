import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Soundpool pool =
      Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
  List<int> _soundIds = [];

  @override
  void initState() {
    super.initState();
    initSoundPool();
  } // 앱이 시작하자마자 initSoundPool 함수를 실행해서 _soundIds리스트에 채울거야!
  // 초기화 할때 파일을 미리 읽어들일 수 있도록. -> 음원을 다 가져와야 프로그램 실행 문제 x (future 와 연결)

  Future<void> initSoundPool() async {
    int soundId =
        await rootBundle.load('asset/do1.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    print('1번: $soundId');

    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/re.wav').then((ByteData soundData) {
      return pool.load(soundData);
    }); // then 함수 안에서만 쓰이는 지역변수
    print('2번: $soundId');
    _soundIds.add(soundId);

    // soundId = await rootBundle.load('asset/mi.wav').then((ByteData soundData) {
    //   return pool.load(soundData);
    // });

    // _soundIds.add(soundId);

    // soundId = await rootBundle.load('asset/fa.wav').then((ByteData soundData) {
    //   return pool.load(soundData);
    // });

    // _soundIds.add(soundId);

    // soundId = await rootBundle.load('asset/sol.wav').then((ByteData soundData) {
    //   return pool.load(soundData);
    // });

    // _soundIds.add(soundId);

    // soundId = await rootBundle.load('asset/la.wav').then((ByteData soundData) {
    //   return pool.load(soundData);
    // });

    // _soundIds.add(soundId);

    // soundId = await rootBundle.load('asset/si.wav').then((ByteData soundData) {
    //   return pool.load(soundData);
    // });

    // _soundIds.add(soundId);

    // soundId = await rootBundle.load('asset/do2.wav').then((ByteData soundData) {
    //   return pool.load(soundData);
    // });

    // _soundIds.add(soundId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('실로폰')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            keybord('도', Colors.red),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: keybord('레', Colors.orange),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: keybord('미', Colors.yellow),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: keybord('파', Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: keybord('솔', Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: keybord('라', Colors.blueGrey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: keybord('시', Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 56),
              child: keybord('도', Colors.red),
            ),
          ],
        ));
  }

  Widget keybord(String text, Color color) {
    return Container(
      width: 50,
      height: double.infinity,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
