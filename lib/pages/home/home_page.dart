import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueb_tecnica_cryptocurrency/configure/get_it_locator.dart';
import 'package:prueb_tecnica_cryptocurrency/configure/idt_route.dart';
import 'package:prueb_tecnica_cryptocurrency/data/model/currency_model.dart';
import 'package:prueb_tecnica_cryptocurrency/data/repository/interactor.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          HomeViewModel(locator<IdtRoute>(), locator<ApiInteractor>()),
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
      context.read<HomeViewModel>().onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Money'),
          ),
          body: _buildHome(viewModel)),
    );
  }

  Widget _buildHome(HomeViewModel viewModel) {
    // final size = MediaQuery.of(context).size;
    final List<CurrencyModel> _criptos = viewModel.status.listCripto;

    return Column(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              viewModel.getListCripto();
            },
            child: Text("Servicios cripto"),
          ),
        ),
        GridImagesCol2()      ],
    );
  }

  Widget GridImagesCol2(List<CurrencyModel> listItems) => (GridView.count(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: listItems.asMap().entries.map((entry) {
          final String nameCripto = entry.value.name!;
          final CurrencyModel valueData = entry.value;
          return ImagesCard( listItems, nameCripto, valueData);
        }).toList(),
      ));

  Widget ImagesCard(
      String item, int index, List res, String name, DataModel valueData) =>
      (Center(
        child: InkWell(
          onTap: () => onTapCard(valueData.id.toString()),
          child: Stack(
            children: <Widget>[
              SizedBox(
                child: Image.network(
                  item,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: AutoSizeText(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      minFontSize: 11,
                      maxFontSize: 12,
                    )),
              ),
            ],
          ),
        ),
      ));

}
