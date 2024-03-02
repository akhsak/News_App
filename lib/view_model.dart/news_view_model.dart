import 'package:news_app/model/headline_model.dart';
import 'package:news_app/service/news_serivice.dart';

class NewsViewModel {

  final _rep=NewsService();

  Future<NewsHeadlineModel> fetchnewschannelHeadline(String channelName)async{
    final response=await _rep.fetchNewsChannelHeadline(channelName);
    return response;
    
  }
  //  Future<CategoriesNewsModel> fetchCategoriesNews(String category) async {
  //   final response = await _rep.fetchNewsChannelHeadline(category);
  //   return response;
  // }
  
}