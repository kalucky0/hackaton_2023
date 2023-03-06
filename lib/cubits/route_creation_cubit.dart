import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'route_creation_state.dart';

class RouteCreationCubit extends Cubit<RouteCreationState> {
  RouteCreationCubit() : super(const RouteCreationStateInitial()) {
    imagePicker = ImagePicker();
  }

  late final ImagePicker imagePicker;

  void getFile() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(RouteCreationImageLoaded(state.tab, image, state.placesImages));
    }
  }

  void getPlaceFile(int index) async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Map<int, XFile?> images = Map.of(state.placesImages);
      images[index] = image;
      emit(RouteCreationImageLoaded(state.tab, state.image, images));
    }
  }

  void setTab(int tab) => emit(ProfileTabChanged(
        tab,
        state.image,
        state.placesImages,
      ));
}
