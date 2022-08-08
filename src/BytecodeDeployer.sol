pragma solidity ^0.8.0;

contract BytecodeDeployer {
    function deploy(bytes memory _data) public returns (address pointer) {
        bytes memory code = abi.encodePacked(
            hex"63",
            uint32(_data.length),
            hex"80600E6000396000F3",
            _data
        );

        assembly {
            pointer := create(0, add(code, 32), mload(code))
        }
    }

}
