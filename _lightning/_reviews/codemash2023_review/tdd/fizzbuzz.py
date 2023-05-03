#!/usr/bin/env pytest


def fb(n):
    div3 = n % 3 == 0
    div5 = n % 5 == 0

    if div3 and div5:
        return "FizzBuzz"

    if div5:
        return "Buzz"

    if div3:
        return "Fizz"

    return str(n)


def test_truth():
    assert True


def test_emits_fizz():
    assert fb(3) == "Fizz"


def test_emits_buzz():
    assert fb(5) == "Buzz"


def test_emits_fizzbuzz():
    assert fb(15) == "FizzBuzz"


def test_sequence():
    expected = """
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16""".strip()

    actual = "\n".join([fb(n) for n in range(1, 17)])

    assert actual == expected


def fb_alt(n) -> str:
    s = str(n)
    has3 = "3" in s
    has5 = "5" in s

    if has3 and has5:
        return "FizzBuzz"

    if has5:
        return "Buzz"

    if has3:
        return "Fizz"

    return s


def test_alt_has_3_emits_fizz():
    assert fb_alt(3) == "Fizz"


def test_alt_has_5_emits_buzz():
    assert fb_alt(5) == "Buzz"


def test_alt_has_3_and_5_emits_fizzbuzz():
    assert fb_alt(35) == "FizzBuzz"
