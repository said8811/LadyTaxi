class OnBordingModel {
  String bgImg;
  String imgUrl;
  String description;

  OnBordingModel(
      {required this.imgUrl, required this.description, required this.bgImg});

  static List<OnBordingModel> pages = [
    OnBordingModel(
        imgUrl: "assets/svg/on_bording_1.json",
        description: "Ishonchli haydovchilar\nxizmatidan foydalaning!",
        bgImg: "assets/images/onBording1BG.jpg"),
    OnBordingModel(
        imgUrl: "assets/svg/on_bording_2.json",
        description: "Bizda barcha haydovchilar\nayollardan iborat",
        bgImg: "assets/images/onBording2BG.jpg"),
    OnBordingModel(
        imgUrl: "assets/svg/on_bording_3.json",
        description: "Ayollar va bolalar uchun\nxavfsiz taksi xizmati",
        bgImg: "assets/images/onBording3BG.jpg"),
  ];
}
