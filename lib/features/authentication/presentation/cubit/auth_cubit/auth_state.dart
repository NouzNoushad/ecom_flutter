part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState(this.imageFile);
  final File? imageFile;

  AuthState copyWith({File? imageFile}) {
    return AuthState(imageFile ?? this.imageFile);
  }

  @override
  List<Object> get props => [];
}
