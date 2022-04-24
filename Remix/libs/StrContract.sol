// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./StringLib.sol";

contract StrContract {
    using StringLib for string;

    function compare(string memory s1, string memory s2) public pure returns(bool) {
        return s1.equals(s2);
    }

}

