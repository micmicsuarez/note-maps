// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'browse_page/browse_page.dart';
import 'library_page/library_page.dart';
import 'mobileapi/mobileapi.dart';
import 'navigation.dart';
import 'topic_page/topic_page.dart';
import 'widgets/widgets.dart';

void main() => runApp(App(
      noteMapRepository: NoteMapRepository(),
    ));

class App extends StatelessWidget {
  final NoteMapRepository noteMapRepository;

  App({
    Key key,
    @required this.noteMapRepository,
  })  : assert(noteMapRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<NoteMapRepository>.value(
      value: noteMapRepository,
      child: MaterialApp(
        title: 'Note Maps',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Color.fromARGB(0xff, 0x8b, 0x6e, 0x60),
        ),
        initialRoute: '/',
        routes: {
          '/': _library,
          BrowsePageArguments.routeName: _browse,
          TopicPageArguments.routeName: _topic,
        },
      ),
    );
  }

  Widget _library(BuildContext context) {
    return LibraryProvider(child: LibraryPage());
  }

  Widget _browse(BuildContext context) {
    final BrowsePageArguments args = ModalRoute.of(context).settings.arguments;
    return MultiProvider(
      providers: [
        TopicMapProvider(topicMapId: args.topicMapId),
        SearchProvider(topicMapId: args.topicMapId),
      ],
      child: BrowsePage(),
    );
  }

  Widget _topic(BuildContext context) {
    final TopicPageArguments args = ModalRoute.of(context).settings.arguments;
    return MultiProvider(
      providers: [
        TopicMapProvider(topicMapId: args.topicMapId),
        TopicProvider(topicMapId: args.topicMapId, topicId: args.topicId),
      ],
      child: TopicPage(),
    );
  }
}
