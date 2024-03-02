import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/headline_model.dart';
import 'package:news_app/view_model.dart/news_view_model.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   NewsViewModel  newsViewModel=NewsViewModel();

  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;
    return Scaffold(
         appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),
         ),
         title: Text('NEws',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),
         ),
         centerTitle: true,
         actions: [
          Icon(Icons.more_vert,
          color: Colors.black,),
          
         ],
         ),
         body: ListView(
          children: [
            SizedBox(
              height: media.height*0.5,
              width: media.width*double.infinity,
              child: FutureBuilder<NewsHeadlineModel>(
                future:newsViewModel.fetchnewschannelHeadline(),
                 builder: (BuildContext context, snapshot) {
                   if (snapshot.connectionState==ConnectionState.waiting) {
                    return Center(
                      child:SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ) ,
                    );
                     
                   }else{
                    return ListView.builder(itemCount:snapshot.data!.articles!.length ,
                    itemBuilder: (context,index){
                       return Container(
                      child: Stack(alignment: Alignment.center,
                      children: [
                         Container(
                          child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                          fit: BoxFit.cover,
                          
                          placeholder: (context, url) => 
                          Container(child:spinkit2),
                          errorWidget: ((context, url, error) => Icon(Icons.error_outline,color: Colors.red,)),
                          ),
                          
                          
                          )
                         
          ],
                      
           
                         ),  );
                         

                      
                    });
                  
                   }

                      
                 }
            ),
           ),
          ],
         )
        );
        
       }
                
      }            
         const spinkit2=SpinKitFadingCircle(
          color: Colors.amber,
           size: 50,
           );
            
            
          
         
    

