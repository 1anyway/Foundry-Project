//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract EmitContractTest is Test {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function testExpectEmit() public {
        ExpectEmit emitter = new ExpectEmit();
        
        vm.expectEmit(true, true, false, true);

        emit Transfer(address(this), address(1337), 1337);

        emitter.t();
    }

    function testExpectEmitDoNotCheckData() public {
        ExpectEmit emitter = new ExpectEmit();

        vm.expectEmit(true, true, false, false);

        emit Transfer(address(this), address(1337), 1338);

        emitter.t();
    }
}

contract ExpectEmit {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function t() public {
        emit Transfer(msg.sender, address(1337), 1337);
    }
}