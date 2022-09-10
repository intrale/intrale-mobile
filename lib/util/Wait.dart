class Wait {

  int milliseconds;
  Function() onFinishFunction;

  Wait({required this.milliseconds, required this.onFinishFunction}){
    int start = DateTime.now().millisecondsSinceEpoch;
    Future.delayed(
              new Duration(milliseconds: this.milliseconds),() {
                print("Tiempo de espera transcurrido:" + (DateTime.now().millisecondsSinceEpoch - start).toString());
                onFinishFunction();
              } ); 
  }

}