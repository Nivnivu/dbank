import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 2154161615;

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue - amount >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Error Accourd");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let cuurentTime = Time.now();
    let timeElapsedNS = cuurentTime - startTime;
    let timeElapsedS = timeElapsedNS / 100000000;
    currentValue := currentValue * (1.00001 ** Float.fromInt(timeElapsedS));
    startTime := cuurentTime;
  };

}