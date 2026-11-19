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