// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

import "./PushNotification.sol";

interface IPerson {
    function volume() external view returns (uint256);
}

/*interface IPerson2 {
    function volume2() external view returns (uint256);
}
interface IPerson3 {
    function volume3() external view returns (uint256);
}
*/

contract Persona {
    uint256 price1 = 0;
    uint256 price2 = 0;
    uint256 price3 = 0;
    uint256 set = 99999000000000000000000;
    uint256 flag = 0;
    uint256 promedio = 0;
    address person1Contract;
    address person2Contract;
    address person3Contract;

    PushNotification pushContract;

    constructor(
        address _person1Contract,
        address _person2Contract,
        address _person3Contract
    ) {
        person1Contract = _person1Contract;
        person2Contract = _person2Contract;
        person3Contract = _person3Contract;
        pushContract = PushNotification(
            "0x3A9888fbBA0Cd8270D1e051d24d0210A2d5c6A5B"
        );
    }

    function getVolume() public {
        price1 = IPerson(person1Contract).volume();
        price2 = IPerson(person2Contract).volume();
        price3 = IPerson(person3Contract).volume();
    }

    function devolverprice1() public view returns (uint256) {
        return price1;
    }

    function devolverprice2() public view returns (uint256) {
        return price2;
    }

    function devolverprice3() public view returns (uint256) {
        return price3;
    }

    function updateset(uint256 _set) public {
        set = _set;
    }

    function devolverpromedio() public view returns (uint256) {
        return promedio;
    }

    function devolverpromedio(uint256 _promedio) public returns (uint256) {
        promedio = price1 + price2 + price3;
        promedio = promedio / 3;
        if (set <= promedio) {
            flag = 1;
            pushContract.notificate(
                "0xFc8087fcbFa0eD96B220511650D0d73dC4593C44"
            );
        }
        if (set > promedio) flag = 0;
        return promedio;
    }
}
