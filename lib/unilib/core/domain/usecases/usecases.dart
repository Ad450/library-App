// interface for all usecases

abstract class UseCase<ReturnType, ParamType> {
  Future<ReturnType> call(ParamType type);
}
