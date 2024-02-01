part of 'journalist_cubit.dart';

@freezed
class JournalistState with _$JournalistState {
  const factory JournalistState.initial() = _Initial;
  const factory JournalistState.loading() = _Loading;
  const factory JournalistState.success({required List<JournalistsMode> models}) = Success;
  const factory JournalistState.error(dynamic e) = _Error;
}
