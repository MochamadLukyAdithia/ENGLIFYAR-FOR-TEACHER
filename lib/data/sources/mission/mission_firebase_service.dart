import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:englifyar_teacher/data/models/mission/mission_model.dart';
import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';

abstract class MissionFirebaseService {
  Future<Either> addOrRemoveMission(MissionModel misi);
  Future<Either> getMission();
}

class MissionFirebaseServiceImpl extends MissionFirebaseService {
  @override
  Future<Either> addOrRemoveMission(MissionModel misi) async {
    try {
      var add = await FirebaseFirestore.instance.collection("Mission").add({
        'category': misi.category,
        'description': misi.description,
        'duration': misi.duration,
      });
      return Right(add);
    } catch (e) {
      return Left("ERROR OCCURED ${e.toString()}");
    }
  }

  @override
  Future<Either> getMission() async {
    try {
      List<MissionEntity> misi = [];
      final data = await FirebaseFirestore.instance.collection("Mission").get();
      for (var i in data.docs) {
        var missionModel = MissionModel.fromJson(i.data());
        misi.add(missionModel.toJson());
      }
      return Right(misi);
    } catch (e) {
      return Left("ERROR OCCURED ${e.toString()}");
    }
  }
}
