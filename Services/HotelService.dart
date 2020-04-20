import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:mock_web_server/mock_web_server.dart';

import '../Models/Utility.dart';

class HotelService{
    /*[Attributes]*/
    Utility utility = new Utility();
    MockWebServer _server;
    

    /*[Contsructors]*/
    HotelService(){
        _server = new MockWebServer();
        _server.start();
    }


    /*[Methods]*/

    /*
    * @Description: Get a listof all hotels from our database
    *
    * @param:
    *
    * @return: JSON
    */
    Future<dynamic> getHotels() async
    {
        this.utility.Custom_Print("START: getHotels");
        //Variables/
        BuildContext context;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        dynamic results;
        final Map<String, dynamic> formData = {
            //"id": 1,
        };

        //Mock API Service
        //Load the JSON file from the "Assets" folder
        String jsonString = await rootBundle.loadString('lib/Projects/Hotel_Search_App/Assets/API/hotels.json');
        Map<String, String> ServerHeaders = new Map();
        ServerHeaders["X-Server"] = "MockDart";
        _server.enqueue(body: jsonString, httpCode: 200, headers: ServerHeaders, delay: new Duration(milliseconds: 1000));

        utility.Custom_Print(utility.App_API_URL + 'hotels');
        //utility.Custom_Print('formData: '+formData.toString());


        HttpClient client = new HttpClient();
        client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

        String url = utility.App_API_URL + 'hotels';

        //HttpClientRequest request = await client.getUrl(Uri.parse(url));
        HttpClientRequest request = await client.get(_server.host, _server.port, url);

        request.headers.set('content-type', 'application/json');

        //request.add(utf8.encode(json.encode(formData)));

        HttpClientResponse response = await request.close();

        final dynamic responseData = await response.transform(utf8.decoder).join();
        final dynamic headers = response.headers;
        
        switch(response.statusCode) { 
            case 200: { 
                dynamic items = json.decode(responseData);
                results = items;
            } 
            break;

            case 201: {
                dynamic items = json.decode(responseData);
                results = items;
            } 
            break;

            case 202: { 
                dynamic items = json.decode(responseData);
                results = items;
            } 
            break;
          
            case 400: {
                dynamic error = json.decode(responseData);
            
                return Future.error(error);
            }

            case 401: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 402: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 403: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 404: {
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }

            case 419: {
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }
                
            default: { 
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }
        }

        utility.Custom_Print("STOP: getHotels");
        return results;
    }


    /*
    * @Description: Get a hotel from our database
    *
    * @param:
    *
    * @return: JSON
    */
    Future<dynamic> getHotel(int id) async
    {
        this.utility.Custom_Print("START: getHotel");
        //Variables/
        BuildContext context;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        dynamic results;
        final Map<String, dynamic> formData = {
            //"id": 1,
        };

        //Mock API Service
        //Load the JSON file from the "Assets" folder
        String jsonString = await rootBundle.loadString('lib/Projects/Jamaican_Wild_Life/Assets/API/animal_'+id.toString()+'.json');
        Map<String, String> ServerHeaders = new Map();
        ServerHeaders["X-Server"] = "MockDart";
        _server.enqueue(body: jsonString, httpCode: 200, headers: ServerHeaders, delay: new Duration(milliseconds: 2000));

        utility.Custom_Print(utility.App_API_URL + 'animal');
        //utility.Custom_Print('formData: '+formData.toString());


        HttpClient client = new HttpClient();
        client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

        String url = utility.App_API_URL + 'animal';

        //HttpClientRequest request = await client.getUrl(Uri.parse(url));
        HttpClientRequest request = await client.get(_server.host, _server.port, url);

        request.headers.set('content-type', 'application/json');

        //request.add(utf8.encode(json.encode(formData)));

        HttpClientResponse response = await request.close();

        final dynamic responseData = await response.transform(utf8.decoder).join();
        final dynamic headers = response.headers;
        
        switch(response.statusCode) { 
            case 200: { 
                dynamic items = json.decode(responseData);
                results = items;
            } 
            break;

            case 201: {
                dynamic items = json.decode(responseData);
                results = items;
            } 
            break;

            case 202: { 
                dynamic items = json.decode(responseData);
                results = items;
            } 
            break;
          
            case 400: {
                dynamic error = json.decode(responseData);
            
                return Future.error(error);
            }

            case 401: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 402: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 403: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 404: {
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }

            case 419: {
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }
                
            default: { 
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }
        }

        utility.Custom_Print("STOP: getHotel");
        return results;
    }


    /*
    * @Description: Allows a user to like an animal photo
    *
    * @param:
    *
    * @return: JSON
    */
    Future<dynamic> postLikeAnimal(int id) async
    {
        this.utility.Custom_Print("START: postLikeAnimal");
        //Variables/
        BuildContext context;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        dynamic results;

        //Mock API Service
        //Load the JSON file from the "Assets" folder
        Map<String, String> ServerHeaders = new Map();
        ServerHeaders["X-Server"] = "MockDart";
        _server.enqueue(body: "1", httpCode: 200, headers: ServerHeaders, delay: new Duration(milliseconds: 2000));

        utility.Custom_Print(utility.App_API_URL + 'animal/like/'+id.toString());
        //utility.Custom_Print('formData: '+formData.toString());


        HttpClient client = new HttpClient();
        client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

        String url = utility.App_API_URL + 'animal/like/'+id.toString();

        //HttpClientRequest request = await client.getUrl(Uri.parse(url));
        HttpClientRequest request = await client.get(_server.host, _server.port, url);

        request.headers.set('content-type', 'application/json');

        //request.add(utf8.encode(json.encode(formData)));

        HttpClientResponse response = await request.close();

        final dynamic responseData = await response.transform(utf8.decoder).join();
        final dynamic headers = response.headers;
        
        switch(response.statusCode) { 
            case 200: { 
                dynamic items = responseData;
                results = items;
            } 
            break;

            case 201: {
                dynamic items = responseData;
                results = items;
            } 
            break;

            case 202: { 
                dynamic items = json.decode(responseData);
                results = items;
            } 
            break;
          
            case 400: {
                dynamic error = json.decode(responseData);
            
                return Future.error(error);
            }

            case 401: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 402: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 403: {
                dynamic error = json.decode(responseData);

                return Future.error(error );
            }

            case 404: {
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }

            case 419: {
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }
                
            default: { 
                dynamic error = json.decode(responseData);

                return Future.error(error);
            }
        }

        utility.Custom_Print("STOP: postLikeAnimal");
        return results;
    }

}