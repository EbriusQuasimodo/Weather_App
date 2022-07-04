import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
//вроде это поиск городов
final cityProvider = StateProvider<String>((ref) {
  return 'London'; //начальный город
});

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({Key? key}) : super(key: key); //создан класс CitySearchBox
  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  static const _radius = 30.0;

  late final _searchController = TextEditingController(); //возможно эо управление поиском

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // circular radius
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), //отступ??
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //выравнивание по центру
        children: [
          Expanded(
            child: SizedBox(
              height: 50, //размер по высоте, ширина автоматическая
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center, //текст по центру
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white, //цвет поисковой строки
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_radius),
                        bottomLeft: Radius.circular(_radius)),
                  ),
                ),
                onSubmitted: (value) =>
                    ref.read(cityProvider.state).state = value,
              ),
            ),
          ),
          InkWell( //кнопка поиска
            child: Container(
              height: 50, //размер
              alignment: Alignment.center, //по центру
              decoration: const BoxDecoration(
                color: AppColors.rainBlueDark, //цвет кнопки
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                ),
              ),
              child: Padding( //отступ
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('search', //текст на кнопке
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            onTap: () { //при нажатии
              FocusScope.of(context).unfocus();
              ref.read(cityProvider.state).state = _searchController.text;
            },
          )
        ],
      ),
    );
  }
}
