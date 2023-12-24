part of 'homepage_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState({required this.productNameData, required this.jobsData});
  final ProductNameData productNameData;
  final JobsData jobsData;

  @override
  List<Object> get props => [productNameData, jobsData];
}

final class HomePageInitial extends HomePageState {
  const HomePageInitial(
      {required super.productNameData, required super.jobsData});
}

class FetchedDataState extends HomePageState {
  const FetchedDataState(
      {required super.productNameData, required super.jobsData});
}

class LoadingState extends HomePageState {
  const LoadingState({required super.productNameData, required super.jobsData});
}
