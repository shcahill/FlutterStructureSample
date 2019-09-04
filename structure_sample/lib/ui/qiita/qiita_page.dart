import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:structure_sample/model/qiita_tag.dart';
import 'package:structure_sample/ui/qiita/qiita_bloc.dart';
import 'package:structure_sample/ui/widget/customIndicator.dart';
import 'package:structure_sample/ui/widget/error_message_widget.dart';

class QiitaPage extends StatelessWidget {
  static PageRoute createPageRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "github"),
      builder: (BuildContext context) => BlocProvider(
        creator: (_, __) => QiitaBloc(),
        child: QiitaPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qiita"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bloc = BlocProvider.of<QiitaBloc>(context);
    return StreamBuilder<QiitaTag>(
      stream: bloc.tag,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorMessageWidget(
            onPressed: () => bloc.inputId("android"),
          );
        }
        if (!snapshot.hasData) {
          return CustomIndicator();
        }
        final tag = snapshot.data;
        return ListTile(
          title: Text(tag.id),
          subtitle: Text("Follower: ${tag.followers}"),
          leading: Image.network(tag.iconUrl),
        );
      },
    );
  }
}
