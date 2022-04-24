// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Ownable.sol";

abstract contract Balance is Ownable {

    // получить баланс контракта
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // вывести все средства с контракта, доступна только owner'у
    function withdraw(address payable _to) public onlyOwner {
        _to.transfer(getBalance());
    }
}

