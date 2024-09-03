import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Hint extends StatefulWidget {
  const Hint({super.key});

  @override
  State<Hint> createState() => _HintState();
}

class _HintState extends State<Hint> {
  Map<String, String> hintData = {
    "20090523":
        "힌트: 노무현은 000 바위에서 떨어졌다.\n 결국 월즈 직전에 이르러서는 페이커의 꾸준함을 강조해온 T1 팬덤의 발언을 페이커를 빠는 식으로 비웃는 용도로 가져와 아무 글에서나 '이런 걸 보면 10년째 LCK의 최정상을 달리고 있는 페이커가 새삼 대단하네...'라는 댓글을 다는 것이 디시인사이드 내에서 유행이 되었고, 에펨코리아나 디시인사이드를 벗어난 타 커뮤니티에서도 사용하게 되었다. 하도 많이 쓰이는 템플릿이 되자 같이 페이커를 섞지 않고 최소한의 단어만 나열해도 이 밈을 알아들을 정도였다. 그러나..."
  };
  List usedKey = [];
  final _hintCode = TextEditingController();
  int _hintUsed = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    _hintCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "힌트 확인",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextField(
                    controller: _hintCode,
                    decoration: InputDecoration.collapsed(hintText: "힌트 코드 입력"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                String input = _hintCode.text;
                if (hintData.containsKey(input)) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("힌트"),
                      content: Text(hintData[input]!),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('확인'))
                      ],
                    ),
                  );
                  if (!usedKey.contains(input)) {
                    _hintUsed++;
                    usedKey.add(input);
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("힌트 코드가 올바르지 않음"),
                      content: Text("힌트 코드를 올바르게 입력했는지 확인하세요."),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('확인'))
                      ],
                    ),
                  );
                }
                setState(() {
                  _hintCode.text = "";
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Text("힌트 $_hintUsed 번 사용됨"),
      ],
    );
  }
}
