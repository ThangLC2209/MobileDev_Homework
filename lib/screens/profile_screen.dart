import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.back),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(.05),
                border: Border.all(color: Colors.red.withOpacity(.5))
              ),

              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
            ),
            const SizedBox(height: 30),
            Text('Le Chi Thang', style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold
            ) ),
            const SizedBox(height:5 ),
            Text('Go Vap , Ho Chi Minh city',style:TextStyle(
              fontWeight: FontWeight.w300
            )),

          ],
        ),
      ),
    );
  }
}
