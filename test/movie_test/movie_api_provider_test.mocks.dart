// Mocks generated by Mockito 5.4.0 from annotations
// in bloc_test/test/movie_test/movie_api_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:bloc_test/src/models/item_model.dart' as _i4;
import 'package:bloc_test/src/models/trailer_model.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

import 'movie_api_provider_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MovieApiProviderTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieApiProviderTest extends _i1.Mock
    implements _i2.MovieApiProviderTest {
  MockMovieApiProviderTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ItemModel?> fetchMovieList() => (super.noSuchMethod(
        Invocation.method(
          #fetchMovieList,
          [],
        ),
        returnValue: _i3.Future<_i4.ItemModel?>.value(),
      ) as _i3.Future<_i4.ItemModel?>);
  @override
  _i3.Future<_i5.TrailerModel?> fetchTrailer(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTrailer,
          [movieId],
        ),
        returnValue: _i3.Future<_i5.TrailerModel?>.value(),
      ) as _i3.Future<_i5.TrailerModel?>);
}
