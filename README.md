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