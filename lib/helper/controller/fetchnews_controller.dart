import 'package:get/get.dart';
import 'package:paper_app/helper/model/news_model.dart';
import 'package:paper_app/helper/service/remote_service.dart';

class ForYouController extends GetxController {
  var isLoading = true.obs;
  var newsList = Newsdata().obs;
  var localList = Newsdata().obs;
  var entertainmentList = Newsdata().obs;
  var headlineList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && newsList.firstRebuild) {
        newsList.value = productss;
      } else {
        newsList.value.value[0].subCards.addAll(productss.value[0].subCards);
        newsList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class LocalController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}

class SportsController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class WeatherController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class MoneyController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class LifeStyleController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class HealthFitnessController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class FoodDrinkController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class TravelController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
class TodayController extends GetxController {
  var isLoading = true.obs;
  var localList = Newsdata().obs;
  Newsdata productss;

  void fetchMarketnews({int page, String topic, String nextUrl}) async {
    try {
      try {
        productss = await RemoteServices.fetchMarketNews(
            page: page, topic: topic, nextUrl: nextUrl);
      } catch (e) {
        print("API ERROR" + e);
      }
      // if (topic.toLowerCase() == "latest") {
      if (productss != null && localList.firstRebuild) {
        localList.value = productss;
      } else {
        localList.value.value[0].subCards.addAll(productss.value[0].subCards);
        localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      }
      // } else if (topic.toLowerCase() == "local") {
      //   if (productss != null && localList.firstRebuild) {
      //     localList.value = productss;
      //   } else {
      //     localList.value.value[0].subCards.addAll(productss.value[0].subCards);
      //     localList.value.value[0].nextPageUrl = productss.value[0].nextPageUrl;
      //   }
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("ERROR ****** ERROR");
      print("ERROR WHILE FETCHING DATA : $e");
    }
  }
}
