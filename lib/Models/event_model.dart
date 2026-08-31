class EventModel {
  //todo: attributes
  String id;

  String title;

  String description;

  String eventImage;

  String eventCategory;

  DateTime eventDateTime;

  String eventTime;
  bool isFavorite;
  //todo: constructor
  EventModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.eventImage,
    required this.eventCategory,
    required this.eventDateTime,
    required this.eventTime,
    this.isFavorite = false,
  });

  //todo: json => object
  EventModel.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        eventCategory: data['eventCategory'],
        eventImage: data['event_image'],
        eventDateTime: data['event_date_time'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                data['event_date_time'] as int,
              )
            : DateTime.now(),
        eventTime: data['eventTime'] ?? '',
        isFavorite: data['is_favorite'],
      );

  //todo: object => json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'event_image': eventImage,
      'eventCategory': eventCategory,
      'event_date_time': eventDateTime.millisecondsSinceEpoch,
      'eventTime': eventTime,
      'is_favorite': isFavorite,
    };
  }
}
