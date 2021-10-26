import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueb_tecnica_cryptocurrency/configure/get_it_locator.dart';
import 'package:prueb_tecnica_cryptocurrency/configure/idt_route.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';
import 'package:prueb_tecnica_cryptocurrency/data/repository/interactor.dart';
import 'package:prueb_tecnica_cryptocurrency/pages/detail/detail_page.dart';
import 'package:prueb_tecnica_cryptocurrency/pages/widgets/coin_item.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(locator<IdtRoute>(), locator<ApiInteractor>()),
      builder: (context, _) {
        return HomeWidget();
      },
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final _route = locator<IdtRoute>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // context.read<HomeViewModel>().onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Cripto'),
          ),
          body: _buildHome(viewModel)),
    );
  }

  Widget _buildHome(HomeViewModel viewModel) {
    // final size = MediaQuery.of(context).size;
    final List<CurrencyModel> _criptos = viewModel.status.listCripto;
    final isLoading = viewModel.status.isLoading;

    return RefreshIndicator(
      onRefresh: () async {
        viewModel.getListCripto();
      },
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _criptos.isEmpty
              ? MaterialButton(
                  onPressed: () {
                    viewModel.getListCripto();
                  },
                  child: const Center(child: Text("Load data")))
              : ImageListWidget(_criptos),
    );
  }

  Widget ImageListWidget(List<CurrencyModel> listItems) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: listItems.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(model: listItems[index])),
              ),
          child: Hero(
              tag: listItems[index].nameid,
              child: Material(type: MaterialType.transparency, child: CoinItem(model: listItems[index])))),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 16,
      ),
    );
  }
}
