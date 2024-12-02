// Mocks generated by Mockito 5.4.4 from annotations
// in infinit_interview/test/artworks_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dio/dio.dart' as _i2;
import 'package:infinit_interview/core/dio/dio_config.dart' as _i3;
import 'package:infinit_interview/logic/api/artworks/artworks_api.dart' as _i5;
import 'package:infinit_interview/object/artwork/api/artwork_api.dart' as _i7;
import 'package:infinit_interview/object/paginated_response/paginated_response.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIConfig_1 extends _i1.SmartFake implements _i3.IConfig {
  _FakeIConfig_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePaginatedResponse_2<T> extends _i1.SmartFake
    implements _i4.PaginatedResponse<T> {
  _FakePaginatedResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ArtworksApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockArtworksApi extends _i1.Mock implements _i5.ArtworksApi {
  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
        returnValueForMissingStub: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  _i3.IConfig get config => (super.noSuchMethod(
        Invocation.getter(#config),
        returnValue: _FakeIConfig_1(
          this,
          Invocation.getter(#config),
        ),
        returnValueForMissingStub: _FakeIConfig_1(
          this,
          Invocation.getter(#config),
        ),
      ) as _i3.IConfig);

  @override
  _i6.Future<_i4.PaginatedResponse<_i7.ArtworkApi>> getPaginatedArtworks({
    required int? page,
    required int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPaginatedArtworks,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue: _i6.Future<_i4.PaginatedResponse<_i7.ArtworkApi>>.value(
            _FakePaginatedResponse_2<_i7.ArtworkApi>(
          this,
          Invocation.method(
            #getPaginatedArtworks,
            [],
            {
              #page: page,
              #limit: limit,
            },
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i4.PaginatedResponse<_i7.ArtworkApi>>.value(
                _FakePaginatedResponse_2<_i7.ArtworkApi>(
          this,
          Invocation.method(
            #getPaginatedArtworks,
            [],
            {
              #page: page,
              #limit: limit,
            },
          ),
        )),
      ) as _i6.Future<_i4.PaginatedResponse<_i7.ArtworkApi>>);
}
