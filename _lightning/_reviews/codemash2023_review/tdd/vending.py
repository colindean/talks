#!/usr/bin/env pytest
# https://github.com/guyroyse/vending-machine-kata

from typing import List, Optional
from enum import Enum


class Coins(Enum):
    Quarter = 25
    Dime = 10
    Nickel = 5
    Penny = 1


class CoinSlot:
    def __init__(self, payload: List[Coins] = []):
        self.payload = payload

    def pop(self) -> Optional[Coins]:
        if self.payload:
            return self.payload.pop()
        else:
            return None


class CoinSensor:

    def __init__(self, slot: CoinSlot):
        self.slot = slot

    def sense(self) -> Optional[Coins]:
        return self.slot.pop()


class CoinReturn:
    def __init__(self):
        self.bin: List[Coins] = []

    def add(self, coin: Coins):
        self.bin.append(coin)


class Display:
    def __init__(self):
        self.text = "INSERT COIN"


class VendingMachine:

    INVALID_COINS = [Coins.Penny]

    def __init__(self,
                 coin_sensor: CoinSensor,
                 coin_return: CoinReturn,
                 display: Display):
        self.coin_sensor = coin_sensor
        self.coin_return = coin_return
        self.display = display

    def feed(self):
        while coin := self.coin_sensor.sense():
            if not coin:
                return
            if coin in self.INVALID_COINS:
                self.coin_return.add(coin)


def test_accept_coin():
    slot = CoinSlot([Coins.Quarter, Coins.Quarter])
    sensor = CoinSensor(slot)
    coin = sensor.sense()
    assert coin == Coins.Quarter
    coin = sensor.sense()
    assert coin == Coins.Quarter


def test_accept_coin_no_coins():
    slot = CoinSlot([])
    sensor = CoinSensor(slot)
    coin = sensor.sense()
    assert coin is None


def test_vm_rejects_pennies():
    slot = CoinSlot([Coins.Penny])
    sensor = CoinSensor(slot)
    coin_return = CoinReturn()
    display = Display()
    vm = VendingMachine(sensor, coin_return, display)
    vm.feed()

    assert Coins.Penny in coin_return.bin
