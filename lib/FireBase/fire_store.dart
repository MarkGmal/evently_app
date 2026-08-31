import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/Models/event_model.dart';

class FireStore {
  static CollectionReference<EventModel> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection("Events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromFireStore(snapshot.data()!),
          toFirestore: (eventModel, options) => eventModel.toFireStore(),
        );
  }

  static Future<void> addEvent(EventModel eventModel) {
    // 1 - Create Collection
    CollectionReference<EventModel> collection = getEventsCollection();
    // 2 - Create Document
    DocumentReference<EventModel> docRef = collection.doc();
    // 3 - assign auto id in eventModel id
    eventModel.id = docRef.id;
    // 4 - save data
    return docRef.set(eventModel);
  }
}
