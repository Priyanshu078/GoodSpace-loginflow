import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goodspacelogin/data/jobs_data.dart';
import 'package:goodspacelogin/data/product_name_data.dart';
import 'package:goodspacelogin/networking/homepageapi.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc()
      : super(LoadingState(
            productNameData: ProductNameData(), jobsData: JobsData())) {
    on<GetDataEvent>((event, emit) => getData(event, emit));
  }

  final HomePageApi _homePageApi = HomePageApi();

  Future<void> getData(GetDataEvent event, Emitter emit) async {
    emit(
        LoadingState(productNameData: ProductNameData(), jobsData: JobsData()));
    var data = await _homePageApi.getProductName();
    var jobsData = await _homePageApi.getJobsData();
    emit(FetchedDataState(productNameData: data, jobsData: jobsData));
  }
}
