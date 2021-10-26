import 'package:prueb_tecnica_cryptocurrency/configure/idt_route.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';
import 'package:prueb_tecnica_cryptocurrency/data/repository/interactor.dart';
import 'package:prueb_tecnica_cryptocurrency/pages/home/home_status.dart';
import 'package:prueb_tecnica_cryptocurrency/utils/errors/currency_error.dart';
import 'package:prueb_tecnica_cryptocurrency/utils/idt_result.dart';
import '../../view_model.dart';

class HomeViewModel extends ViewModel<HomeStatus> {
  final IdtRoute _route;
  final ApiInteractor _interactor;
  late String languageUser;

  HomeViewModel(this._route, this._interactor) {
    status = HomeStatus(
      money: 'Moneda Actual',
      listCripto: [],
    );
  }

  void onInit() async {
    getListCripto();
  }

  void getListCripto() async {
    // status = status.copyWith(isLoading: true);

    final listCriptoResponse = await _interactor.getListCriptos();

    if (listCriptoResponse is IdtSuccess<List<CurrencyModel>?>) {
      status = status.copyWith(
          listCriptoResponse: listCriptoResponse.body); // Status reasignacion
    } else {
      final erroRes = CurrencyError as IdtFailure<CurrencyError>;
      print('Error **${erroRes.message}');
      UnimplementedError();
    }
  }
}
