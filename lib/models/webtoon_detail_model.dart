class WebtoonDetailModel {
  final String title, about, genere, age, thumb;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        about = json['about'],
        genere = json['genere'],
        age = json['age'];
}
