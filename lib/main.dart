import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:untitled/GetSampleApi.dart';
import 'package:untitled/GetOverviewApi.dart';
import 'package:percent_indicator/percent_indicator.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bottom Street'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isloading = false;
  List<GetSampleApi>? apiList;
  Map<String,dynamic> OverviewList = {};

Future<void> callRequest() async {
  isloading = true;
  getApiData();

  OverviewList = await getOverviewData();
  isloading = false;
}


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callRequest();

  }
  @override
  Widget build(BuildContext context) {


    return isloading?Scaffold(
      body: Center(
        child: CircularProgressIndicator(

        )
      )
    ): Scaffold(

      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'Overview',
            style: TextStyle(

                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.blue),
            textAlign: TextAlign.left,

          ),
          ListTile(
            leading: Text("Sector"),
            trailing: Text("${OverviewList["Sector"]}"),
          ),
          ListTile(
            leading: Text("Industry"),
            trailing: Text("${OverviewList["Industry"]}"),
          ),
          ListTile(
            leading: Text("Market Cap."),
            trailing: Text("${OverviewList["MCAP"]}"),
          ),
          ListTile(
            leading: Text("Enterprise Value(EV)"),
            trailing: Text("${OverviewList["EV"]}"),
          ),
          ListTile(
            leading: Text("Book Value/Share"),
            trailing: Text("${OverviewList["BookNavPerShare"].toStringAsFixed(2)}"),
          ),
          ListTile(
            leading: Text("PEG Ratio"),
            trailing: Text("${OverviewList["PEGRatio"].toStringAsFixed(2)}"),
          ),
          ListTile(
            leading: Text("Dividend Yield"),
            trailing: Text("${OverviewList["Yield"].toStringAsFixed(2)}"),
          ),













          SizedBox(
            height: 40,
          ),
          Text(
            'Performance',
            style: TextStyle(

                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.blue),
                textAlign: TextAlign.left,

          ),
          SizedBox(
            height: 40,
          ),



          if (apiList != null)
          getList()


        ],
      )


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }




  Widget getList(){
    double percent = 0.0;

    return Expanded(
      child: ListView.builder(
          itemCount: apiList!.length,
          itemBuilder: (BuildContext context , int index ){
        return ListTile(
          leading: Text("${apiList![index].label}"),
          trailing: apiList![index].changePercent! > 0 ? Text(" ${apiList![index].changePercent!.toStringAsFixed(2)}",style: TextStyle(color:Colors.green)):Text(" ${apiList![index].changePercent!.toStringAsFixed(2)}",style: TextStyle(color:Colors.red)),
          title:LinearPercentIndicator( //leaner progress bar
            animation: true,
            animationDuration: 2000,

            lineHeight: 40.0,
            width: 150,
            alignment: MainAxisAlignment.center,

            percent:((apiList![index].changePercent!.abs())!/371.99621570482497634815515610),



            progressColor: Colors.green[400],
            backgroundColor: Colors.grey[300],
          ),


            );


      }),
    );
  }

  Future<void> getApiData() async {
    String url = "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en";

    var result = await http.get(Uri.parse(url));

    apiList = jsonDecode(result.body)
    .map((item) => GetSampleApi.fromJson(item))
    .toList()
    .cast<GetSampleApi>();


    setState(() {

    });
  }
  Future<Map<String,dynamic>> getOverviewData() async {
    String url = "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en";

    var result = await http.get(Uri.parse(url));

    Map <String,dynamic> OverviewList = jsonDecode(result.body);

    return OverviewList;

    setState(() {

    });
  }
}
