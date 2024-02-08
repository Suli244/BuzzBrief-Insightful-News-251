import 'package:hive/hive.dart';
import 'package:insightful_news_251/l_p/dffgdfg/dsafasdfaf/prem_hive_model.dart';


class HJKHEfdf {
  Future<Gjhkdafjlaf?> fff() async {
    final box = await Hive.openBox<Gjhkdafjlaf>('prem');
    final result = box.get('keyPrem');
    return result;
  }

  sssss(Gjhkdafjlaf model) async {
    final box = await Hive.openBox<Gjhkdafjlaf>('prem');
    box.put('keyPrem', model);
  }
}
