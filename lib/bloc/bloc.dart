import 'package:milkiyat/model/model.dart';
import 'package:milkiyat/network_provider/network_provider.dart';
import 'package:rxdart/rxdart.dart';


class Bloc{
  final networkProvider =  NetworkProvider();
  final _contoller = PublishSubject<Model>();


  Stream<Model> get allList => _contoller.stream;

  fetchAllList() async{
    Model model = await networkProvider.fetchList();
    _contoller.sink.add(model);
  }

  dispose(){
    _contoller.close();
  }
}

final bloc = Bloc();