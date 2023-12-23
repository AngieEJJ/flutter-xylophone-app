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
  final List<int> _soundIds = [];
  bool _isLoading = true;

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
    // print('1번: $soundId');

    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/re.wav').then((ByteData soundData) {
      return pool.load(soundData);
    }); // then 함수 안에서만 쓰이는 지역변수
    // print('2번: $soundId');
    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/mi.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });

    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/fa.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });

    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/sol.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });

    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/la.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });

    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/si.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });

    _soundIds.add(soundId);

    soundId = await rootBundle.load('asset/do2.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });

    _soundIds.add(soundId);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('실로폰')),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  keybord('도', Colors.red, _soundIds[0]),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: keybord('레', Colors.orange, _soundIds[1])),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: keybord('미', Colors.yellow, _soundIds[2]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: keybord('파', Colors.green, _soundIds[3]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: keybord('솔', Colors.blue, _soundIds[4]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: keybord('라', Colors.blueGrey, _soundIds[5]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: keybord('시', Colors.purple, _soundIds[6]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 56),
                    child: keybord('도', Colors.red, _soundIds[7]),
                  ),
                ],
              ));
  }

  Widget keybord(String text, Color color, int soundId) {
    return GestureDetector(
      onTap: () {
        pool.play(soundId);
      },
      child: Container(
        width: 50,
        height: double.infinity,
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
