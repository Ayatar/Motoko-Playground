//Motoko'ya hoşgeldiniz.
//actor -> canister -> smart contract
//import'lar
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";

actor {
  //değişkenler -> Kısa süreli hafızaya attığımız bilgi.
  // let = immutablle (değiştirilemez)
  //var = mutable (değiştirilebilir)

  // Type Language

  let name: Text = "Kayra";
  let surname: Text = "Elçi";

Debug.print(debug_show (name));
Debug.print(debug_show (surname));




}
