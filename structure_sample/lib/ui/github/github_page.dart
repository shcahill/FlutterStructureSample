import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:structure_sample/model/license.dart';
import 'package:structure_sample/ui/github/github_bloc.dart';
import 'package:structure_sample/ui/widget/CustomIndicator.dart';
import 'package:structure_sample/ui/widget/error_message_widget.dart';

class GitHubPage extends StatelessWidget {
  static PageRoute createPageRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "github"),
      builder: (BuildContext context) => BlocProvider(
        creator: (_, __) => GitHubBloc(),
        child: GitHubPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<GitHubBloc>(context).requestLicences();
            },
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bloc = BlocProvider.of<GitHubBloc>(context)..requestLicences();
    return StreamBuilder<List<License>>(
      stream: bloc.licenseList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorMessageWidget(
            onPressed: () => bloc.requestLicences(),
          );
        }
        if (!snapshot.hasData) {
          return CustomIndicator();
        }
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final item = snapshot.data[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.key),
              );
            });
      },
    );
  }
}
