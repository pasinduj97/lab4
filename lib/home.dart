import 'package:flutter/material.dart';
import 'package:lab4/services/AgifyService.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String name;
  late int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agify'), centerTitle: true,),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:  [
               TextField(
                 onChanged: (value) {
                   name = value;
                 },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                onPressed:  () async {
                  AgifyService instance = AgifyService(name: name);
                  int newAge = await instance.getAge();

                   setState(() {
                      age = newAge;
                   });

                },
                child: const Text('Get Age', style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 20.0),
              age != 0 ? Text('Age is $age',  style: const TextStyle(
                fontSize: 30.0,
                color: Colors.grey
              ),) : Text('')
            ],
          ),
        ),
      ),
    );
  }
}
