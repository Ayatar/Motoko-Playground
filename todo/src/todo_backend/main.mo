// İmportlar

import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";

actor Assistant {
type ToDo = {
  description: Text;
  completed: Bool;
};

func natHash(n: Nat) : Hash.Hash {
  Text.hash(Nat.toText(n))
};

var todos = Map.HashMap<Nat, ToDo>(0, Nat.equal, natHash);
var nextId: Nat = 0;

public query func getTodos() : async [ToDo] {
  Iter.toArray(todos.vals());
};

public func addTodo(description: Text) : async Nat {
  let id = nextId;
  todos.put(id, {description=description; completed = false});
  nextId += 1;
  id // return id;
};

public func completeTodo(id: Nat) : async () {
  ignore do ? {
      let description = todos.get(id)!.description;
      todos.put(id, {description; completed = true});
  }
};

  public query func showTodos() :async Text {
    var output: Text = "\n_______-TO-DOs________";
    for (todo: ToDo in todos.vals()) {
      output #= "\n" # todo.description;
      if (todo.completed) { output #= " + "};
    };
    output #"\n"
  };

  public func clearCompleted() : async () {
    todos := Map.mapFilter<Nat, ToDo, ToDo>(todos, Nat.equal, natHash,
    func(_, todo){if (todo.completed) null else ?todo});
  };

};