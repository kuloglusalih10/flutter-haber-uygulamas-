import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/models/articles.dart%20';
import 'package:haber_uygulamasi/view_model/article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Haberler"),
      ),
      body: ListView.builder(
          itemCount:vm.viewModel.articles.length,
          itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async{
                      if (!await launchUrl(Uri.parse(vm.viewModel.articles[index].url!))) {
                      throw Exception('Could not launch');
                      }
                    },
                    child: Image.network(vm.viewModel.articles[index].urlToImage ?? 'https://media.istockphoto.com/id/1357365823/vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo.jpg?s=612x612&w=0&k=20&c=PM_optEhHBTZkuJQLlCjLz-v3zzxp-1mpNQZsdjrbns='),
                  ),
                  ListTile(title :Text(vm.viewModel.articles[index].title ?? '', style: TextStyle(fontWeight: FontWeight.bold),))
                ],
              ),
            );

      })
    );
  }
}
