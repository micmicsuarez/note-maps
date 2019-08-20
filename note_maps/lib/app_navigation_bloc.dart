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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';

import 'library_bloc.dart';
import 'library_screen.dart';
import 'mobileapi/mobileapi.dart';
import 'trash_screen.dart';

enum AppNavigationPage {
  library,
  trash,
}

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  @override
  AppNavigationState get initialState =>
      AppNavigationState(AppNavigationPage.library);

  @override
  Stream<AppNavigationState> mapEventToState(AppNavigationEvent event) async* {
    yield AppNavigationState(event.page);
  }
}

class AppNavigationEvent {
  final AppNavigationPage page;

  AppNavigationEvent(this.page) : assert(page != null);
}

class AppNavigationState {
  final AppNavigationPage page;

  AppNavigationState(this.page) : assert(page != null);
}