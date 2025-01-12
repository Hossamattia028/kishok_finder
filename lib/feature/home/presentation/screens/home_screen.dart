import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiosk_finder/core/utils/small_fun.dart';
import 'package:kiosk_finder/feature/authentication/presentation/screens/login.dart';
import 'package:kiosk_finder/feature/home/domain/entities/kiosk_entity.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_bloc.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_event.dart';
import 'package:kiosk_finder/feature/home/presentation/bloc/home_state.dart';
import 'package:kiosk_finder/feature/shared_widgets/snackbars_builder.dart';  



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static GoogleMapController? mapController;
 

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Kiosk Finder'),  
        actions: [  
          IconButton(
            onPressed: ()async{
              //will replace this with auth bloc logoutEvent
              await FirebaseAuth.instance.signOut();
              Util.pushPageAndRemoveRoutes(const LoginScreen(), context);
            },
            icon: const Icon(Icons.logout),
          ),
          BlocBuilder<HomeBloc,HomeState>(
            builder: (ctx,state){
              var bloc = HomeBloc.get(ctx);
              return PopupMenuButton<String>(  
                onSelected: (String city) {  
                  if(city==bloc.selectedCity)return;
                  SnackBarBuilder.showFeedBackMessage(context, 'Please Wait', Colors.green);
                  BlocProvider.of<HomeBloc>(context).add(FetchKiosks(city)); 
                  SnackBarBuilder.showFeedBackMessage(context, 'Loading....', Colors.deepOrangeAccent); 
                },  
                itemBuilder: (BuildContext context) {  
                  return {'giza', 'cairo'}.map((String city) {  
                    return PopupMenuItem<String>(  
                      value: city,  
                      child: Text(city),  
                    );  
                  }).toList();  
                },  
              );
          })
        ],  
      ),  
      body: BlocBuilder<HomeBloc, HomeState>(  
        builder: (ctx, state) {  
          var bloc = HomeBloc.get(ctx);
          var list = bloc.kioskList;
          return GoogleMap(  
            initialCameraPosition: const CameraPosition(  
              target: LatLng(30.0422, 31.2357), // Default to Giza  
              zoom: 12,  
            ),  
            markers: Set<Marker>.of(list.map((kiosk) {  
              return Marker(  
                markerId: MarkerId(kiosk.name),  
                position: LatLng(kiosk.lat, kiosk.lng),  
                infoWindow: InfoWindow(  
                  title: kiosk.name,  
                  snippet: kiosk.address,  
                  onTap: () => _showKioskDetails(context, kiosk),  
                ),  
              );  
            })),  
            onMapCreated: (controller) {  
              mapController = controller;  
            },  
          );
        },  
      ),  
    );  
  }  

  void _showKioskDetails(BuildContext context, KioskEntity kiosk) {  
    showDialog(  
      context: context,  
      builder: (context) {  
        return AlertDialog(  
          title: Text(kiosk.name),  
          content: Column(  
            mainAxisSize: MainAxisSize.min,  
            children: [  
              Image.network(kiosk.image),  
              Text('Address: ${kiosk.address}'),  
              Text('Lat: ${kiosk.lat}, Lng: ${kiosk.lng}'),  
            ],  
          ),  
          actions: <Widget>[  
            TextButton(  
              onPressed: () {  
                Navigator.of(context).pop();  
              },  
              child: const Text('Close'),  
            ),  
          ],  
        );  
      },  
    );  
  }  
}