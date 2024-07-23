abstract class Faliures{
  final String error;

  Faliures(this.error);

}
class ServerError extends Faliures{
  ServerError(super.error);
}
