import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  bool isSignup = false; // login 상태
  var password = '';

  @override
  Widget build(BuildContext context) {
    void _tryValidator() {
      var valid = _formKey.currentState?.validate();
      if (valid == true) {
        _formKey.currentState?.save();
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // note: RenderFlex children have non-zero flex but incoming height constraints are unbounded.
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // note: 상단 패널
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Row(
                    children: [
                      // note: 좌측 패널
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.orange[200]),
                          child: Column(
                            children: [
                              SizedBox(height: 150),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isSignup = false;
                                    });
                                  },
                                  child: Text('로그인')),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isSignup = true;
                                    });
                                  },
                                  child: Text('회원가입')),
                              TextButton(onPressed: () {}, child: Text('튜토리얼')),
                              TextButton(onPressed: () {}, child: Text('밝기조절')),
                            ],
                          ),
                        ),
                      ),
                      // note: 우측 패널
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 55),
                              // note: 우측 패널 내 상단 로그인/회원가입 탭
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (!isSignup) Text('로그인'),
                                    SizedBox(width: 50),
                                    if (isSignup) Text('회원가입'),
                                  ],
                                ),
                              ),
                              // note: Login 화면
                              if (!isSignup)
                                Container(
                                  child: Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 40),
                                      child: Form(
                                        key: _formKey,
                                        child: Column(children: [
                                          TextFormField(
                                            key: ValueKey(1),
                                            validator: (value) {
                                              if (value!.isEmpty || value.length < 4) {
                                                return 'Please enter at least 4 characters';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'id',
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            key: ValueKey(2),
                                            validator: (value) {
                                              if (value!.isEmpty || value.length < 5) {
                                                return 'Password must be at least characters long.';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'password',
                                            ),
                                            obscureText: true,
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),

                              // note: Signup 화면
                              if (isSignup)
                                Container(
                                  child: Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 40),
                                      child: Form(
                                        key: _formKey,
                                        child: Column(children: [
                                          TextFormField(
                                            key: ValueKey(3),
                                            validator: (value) {
                                              if (value!.isEmpty || value.length < 4) {
                                                return 'Please enter at least 4 characters';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'id',
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            onChanged: (value) {
                                              password = value;
                                            },
                                            key: ValueKey(4),
                                            validator: (value) {
                                              if (value!.isEmpty || value.length < 6) {
                                                return 'Password must be at least characters long.';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'password',
                                            ),
                                            obscureText: true,
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            key: ValueKey(5),
                                            validator: (value) {
                                              if (password != value) {
                                                return 'Please enter the same password';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'password 확인',
                                            ),
                                            obscureText: true,
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),

                              // note: 로그인/회원가입 버튼
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        _tryValidator();
                                      },
                                      icon: Icon(Icons.info_outlined),
                                      label: Text('확인'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // note: 하단 패널 - 미구현
              // Container(
              //   margin: EdgeInsets.all(25),
              //   height: 100,
              //   decoration: BoxDecoration(
              //     color: Colors.yellow,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
