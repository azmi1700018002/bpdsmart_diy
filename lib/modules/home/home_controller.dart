import 'dart:math';
import 'package:bpdsmart_diy/services/api.dart';
import 'package:bpdsmart_diy/models/response/users_response.dart';
import 'package:bpdsmart_diy/modules/home/home.dart';
import 'package:bpdsmart_diy/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/popular_provider.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;

  HomeController({required this.apiRepository});

  var currentTab = MainTabs.home.obs;
  var users = Rxn<UsersResponse>();
  var user = Rxn<Datum>();
  var lstPopular = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataError = false.obs;
  var data = Get.arguments;
  late MainTab mainTab;
  late DiscoverTab discoverTab;
  late ResourceTab resourceTab;
  late InboxTab inboxTab;
  late MeTab meTab;

  @override
  void onInit() async {
    super.onInit();

    mainTab = MainTab();
    // loadUsers();

    discoverTab = DiscoverTab();
    resourceTab = ResourceTab();
    inboxTab = InboxTab();
    meTab = MeTab();

    getPopular();
  }

  // Future<void> loadUsers() async {
  //   var _users = await apiRepository.getUsers();
  //   if (_users!.data!.length > 0) {
  //     users.value = _users;
  //     users.refresh();
  //     _saveUserInfo(_users);
  //   }
  // }

  void getPopular() {
    try {
      isDataProcessing(true);
      PopularProvider().getPopular().then((resp) {
        lstPopular.clear();
        isDataProcessing(false);
        lstPopular.addAll(resp);
        isDataError(false);
      }, onError: (err) {
        isDataProcessing(false);
        isDataError(true);
      });
    } catch (exception) {
      isDataProcessing(false);
      isDataError(true);
    }
  }

  void signout() {
    var prefs = Get.find<SharedPreferences>();
    prefs.clear();

    // Get.back();
    NavigatorHelper.popLastScreens(popCount: 2);
  }

  void _saveUserInfo(UsersResponse users) {
    var random = new Random();
    var index = random.nextInt(users.data!.length);
    user.value = users.data![index];
    var prefs = Get.find<SharedPreferences>();
    prefs.setString(StorageConstants.userInfo, users.data![index].toRawJson());

    // var userInfo = prefs.getString(StorageConstants.userInfo);
    // var userInfoObj = Datum.fromRawJson(xx!);
    // print(userInfoObj);
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.discover:
        return 1;
      case MainTabs.resource:
        return 2;
      case MainTabs.inbox:
        return 3;
      case MainTabs.me:
        return 4;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.discover;
      case 2:
        return MainTabs.resource;
      case 3:
        return MainTabs.inbox;
      case 4:
        return MainTabs.me;
      default:
        return MainTabs.home;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPopular();
  }

  @override
  void onClose() {
    super.onClose();
    getPopular();
  }
}
