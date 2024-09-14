import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/presentation/users_screen/components/user_widget.dart';
import 'package:store_app_api/presentation/widgets/custom_text.dart';
import 'package:store_app_api/providers/user_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Users',
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder(
          future: userProvider.getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error Occured ${snapshot.hasError}');
            } else {
              return ListView.builder(
                itemCount: userProvider.userList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return UserWidget(
                    imgUri: userProvider.userList[index].avatar.toString(),
                    userName: userProvider.userList[index].name.toString(),
                    userRole: userProvider.userList[index].role.toString(),
                    email: userProvider.userList[index].email.toString(),
                  );
                },
              );
            }
          },
        ));
  }
}
