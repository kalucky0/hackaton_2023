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
      emit(RouteCreationImageLoaded(image));
    }
  }

  void setTab(int tab) => emit(ProfileTabChanged(tab, state.file));
}
