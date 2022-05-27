/// name : "title2"
/// image_url : null
/// duration : "0h 3m"
/// is_quick_event : false
/// day : "Day 1"

class EventResponse {
  EventResponse(
      {this.name,
      this.imageUrl,
      this.duration,
      this.isQuickEvent,
      this.day,
      this.timeSlot,
      this.id});

  EventResponse.fromJson(dynamic json) {
    name = json['name'];
    imageUrl = json['image_url'];
    duration = json['duration'];
    isQuickEvent = json['is_quick_event'];
    day = json['day'];
    timeSlot = json['timeSlot'];
    id = json['id'];
  }
  String? name;
  dynamic imageUrl;
  String? duration;
  bool? isQuickEvent;
  String? day;
  String? timeSlot;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image_url'] = imageUrl;
    map['duration'] = duration;
    map['is_quick_event'] = isQuickEvent;
    map['day'] = day;
    map['timeSlot'] = timeSlot;
    map['id'] = id;
    return map;
  }
}
