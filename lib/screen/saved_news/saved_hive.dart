import 'package:hive/hive.dart';
import 'package:insightful_news_251/screen/saved_news/saved_model/saved_model.dart';

const _key = 'saved';

class SavedHive {
  static Future<bool> hasData({
    required String group,
    required int id,
  }) async {
    Box<Map<dynamic, dynamic>>? dB;
    if (Hive.isBoxOpen(_key)) {
      dB = Hive.box(_key);
    } else {
      dB = await Hive.openBox(_key);
    }
    Map<dynamic, dynamic>? list = dB.get(_key);
    if (list != null) {
      if (list[group] != null) {
        for (var e in list[group]) {
          if (e.id == id) {
            return true;
          }
        }
      }
    }

    return false;
  }

  static Future<void> dataToCache({
    required String group,
    required SavedModel data,
  }) async {
    Box<Map<dynamic, dynamic>>? dB;
    if (Hive.isBoxOpen(_key)) {
      dB = Hive.box(_key);
    } else {
      dB = await Hive.openBox(_key);
    }
    Map<dynamic, dynamic>? list = dB.get(_key);
    if (list == null) {
      list = {
        group: [data]
      };
    } else {
      if (list[group] != null) {
        list[group]!.add(data);
      } else {
        list.addAll({
          group: [data]
        });
      }
    }
    await dB.put(_key, list);
    // if (dB.isOpen) {
    //   await dB.close();
    // }
    return Future.value(data);
  }

  static Future<void> deleteData({
    required int id,
    required String group,
  }) async {
    Box<Map<dynamic, dynamic>>? dB;
    if (Hive.isBoxOpen(_key)) {
      dB = Hive.box(_key);
    } else {
      dB = await Hive.openBox(_key);
    }
    Map<dynamic, dynamic>? list = dB.get(_key);
    print('______${list?[group].length}');
    for (var e in list?[group]) {
      print('+++++ ${e.id} $id');
      if (e.id == id) {
        print('+++++ ');
        list?[group].remove(e);
      }
    }
    print('___________${list?[group].length}');
    await dB.put(_key, list!);
    // if (dB.isOpen) {
    //   await dB.close();
    // }
    return Future.value();
  }
}
