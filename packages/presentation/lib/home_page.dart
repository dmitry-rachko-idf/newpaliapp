import 'package:flutter/material.dart';
import 'package:presentation/bloc/bloc_data.dart';
import 'package:presentation/bloc/bloc_state.dart';
import 'package:presentation/bloc/home_bloc.dart';
import 'package:presentation/home_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState<D> extends BlocState<MyHomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  void _checkString() {
    bloc.isPalindrome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
          stream: bloc.dataStream,
          initialData: BlocData.init(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            final blocData = snapshot.data;
            if (blocData is BlocData) {
              final screenData = blocData.data;
              if (blocData.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (screenData is HomeData) {
                return _buildResult(screenData);
              } else {
                return Container(
                  color: Colors.red,
                );
              }
            } else {
              return Container(
                color: Colors.green,
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkString,
        child: const Icon(Icons.check_circle),
      ),
    );
  }

  Widget _buildResult(HomeData screenData) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(20),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextFormField(
                onChanged: bloc.setPaliString,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.black.withAlpha(120),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Is palindrome: ${screenData.isPalindrome}'),
          ],
        ),
      );
}
