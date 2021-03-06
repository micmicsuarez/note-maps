// Copyright 2020 Google LLC
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

import {Module} from 'vuex';
import {NoteMapsAPI} from '@note-maps/models';
import {RootState} from '../types';
import {actions} from './actions';
import {getters} from './getters';
import {mutations} from './mutations';
import {NoteMapState} from './types';

export const state: NoteMapState = {
  error: false,
  notes: {},
};

const namespaced = true;

/** Builds a Vuex module including actions that delegate to an NoteMapsAPI.
 *
 * @param {NoteMapsAPI} api - The NoteMapsAPI responsible for fetching and
 *   storing notes.
 * @return {Module} The new Vuex module.
 */
export function Library(api: NoteMapsAPI): Module<NoteMapState, RootState> {
  return {
    namespaced,
    state,
    getters,
    actions: actions({api}),
    mutations,
  };
}
