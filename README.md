# Dart OOP Assignment: Kigali Bus Card

**Name:** MUHAYEMARIYA Faustine
**Student ID:** 26919

## My numbers
- D = 19, L = 9
- Starting balance = 1190 RWF
- Bus fare = 219 RWF
- Student discount = 19%

## Part 1: Why no setter for balance?

Because the balance should only change through `topUp()` and `pay()`,
which enforce the rules (top-up limits, no payment without enough money).
A public setter would let any code set the balance to any value even
negative or fake amounts, bypassing those rules and cheating the system.
So `balance` is read-only from outside the class to protect its integrity.

## Part 2: What does ~/ do?

`~/` is integer (truncating) division. It divides and drops the decimal
part, returning an `int`. `/` is normal division and returns a `double`
with the decimal part kept.

Test:
    print(237 * 17 / 100);   // 40.29  (double — decimal kept)
    print(237 * 17 ~/ 100);  // 40     (int — decimal dropped)

237 * 17 = 4029, so 4029 / 100 = 40.29 but 4029 ~/ 100 = 40.

In StudentCard.pay() we use `int off = fare * _discount ~/ 100;` because
`off` must be a whole number of RWF (an int). If we used `/`, the result
would be a double and Dart would not allow assigning it to an int variable.

## Output of main.dart
```
Error: name too short
Owner: MUHAYEMARIYA Faustine | Balance: 1190 RWF
Owner: MUHAYEMARIYA Faustine | Balance: 1190 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 219 RWF
Paid 219 RWF
Owner: MUHAYEMARIYA Faustine | Balance: 2752 RWF
Student discount: 41 RWF
Paid 178 RWF
Owner: MUHAYEMARIYA Faustine | Balance: 1012 RWF
Student card: 19% off
```

## Part 4: Bug table

| Bug | The line | Why it is wrong (my words) | My fix |
|---|---|---|---|
| 1 | `String _brand;` | `_brand` is a String that cannot be null. It has no starting value, so Dart gives an error saying it must be initialized. | `String _brand = '';` |
| 2 | `int _battery;` | `_battery` is an int that cannot be null. It also has no starting value, so Dart gives the same error. | `int _battery = 0;` |
| 3 | `SmartPhone(String brand, int battery, String system) {` | `SmartPhone` extends `Phone`, so the parent `Phone` constructor must run first. But `super(brand, battery)` was never called, so Dart does not know how to build the parent. | `SmartPhone(String brand, int battery, String system) : super(brand, battery) {` |
| 4 | `@override` on `void restart()` | `@override` only works when the parent class has the same method. `Phone` has no `restart`, so `restart` is not really an override. | Remove `@override` from `restart()`. |
| 5 | `p.battery = 100;` | The class only has a getter for `battery`, no setter. So you cannot assign a value to it from outside. | Add `set battery(int newBattery)` that only accepts values from 0 to 100. |
| Not a bug | `p.battery = 100;` | This line looks wrong because it looks like it is setting a private field directly. But it is fine — it calls the public setter we added, which checks the value is between 0 and 100. So it is valid. | (none) |