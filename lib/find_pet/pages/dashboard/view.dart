import 'package:find_pet/find_pet/base_page/base_page.dart';
import 'package:find_pet/find_pet/find_pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'component/component.dart';

class DashboardPage extends BasePage {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseState<DashboardPage> with BasicPage {
  late RefreshController _refreshController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    context.read<DashboardBloc>().add(LoadDogs());
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(1.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Animals perdidos',
                style: theme.textTheme.headline6!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            BlocBuilder<DashboardBloc, DashboardState>(
              buildWhen: (pre, curr) {
                if (curr is DogsLoaded) {
                  return true;
                }
                if (curr is DashboardLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is DogsLoaded) {
                  _refreshController.loadComplete();
                  return _getList(state);
                }

                if (state is DashboardLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return const Center();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getList(DogsLoaded state) {
    return Expanded(
      child: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        onLoading: loadRequests,
        scrollDirection: Axis.vertical,
        controller: _refreshController,
        child: ListView.separated(
          separatorBuilder: (_, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => ListItem(url: state.dogs[index]),
          itemCount: state.dogs.length,
        ),
      ),
    );
  }

  void loadRequests() {
    _refreshController.requestLoading();
    context.read<DashboardBloc>().add(LoadDogs());
    return;
  }

  @override
  Widget bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
