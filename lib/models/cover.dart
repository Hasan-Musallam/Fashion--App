class CoverModel {
  final String image;
  final String name;
  CoverModel({
    required this.image,
    required this.name,
});
  static List<CoverModel> covers = [
    CoverModel(
      image: "assets/CoverImages/Rectangle440.png",
      name: "White collection",
    ),
    CoverModel(
      image: "assets/October/Backgroungimm.png",
      name: "Black collection",
    ),
    CoverModel(
      image: "assets/CoverImages/Rectangle440.png",
      name: "White collection",
    ),

  ];
}