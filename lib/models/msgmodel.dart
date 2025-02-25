class Msg {
  String text;
  String time;
  bool isMe;

  Msg({
    this.text = '',
    this.time = '',
    this.isMe = false,
  });
}

List<Msg> messages = <Msg>[
  Msg(
    isMe: true,
    text: 'Hi, I just wanna know that how much time you’ll be updated.',
    time: '10:52',
  ),
  Msg(
    isMe: false,
    text: 'Maybe, Nearly July, 2022',
    time: '10:53',
  ),
  Msg(
    isMe: true,
    text: 'OKay, I”m Waiting....',
    time: '10:53',
  )
];
